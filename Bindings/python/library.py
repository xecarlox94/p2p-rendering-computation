import ctypes
from ctypes import Structure, c_char_p, c_int, cdll
from dataclasses import dataclass, astuple
import time
import json
from urllib.parse import urlparse
from typing import List
import subprocess
import uuid
import dacite
import os
import sqlalchemy
import dataclasses
from typing import Union
import schedule
import threading
import requests

p2prc = ctypes.CDLL("SharedObjects/p2prc.so")

p2prc.Init("")

# Start running schedule
schedule.run_pending()

# # Create Sqlite database to track processes 
# engine=sqlalchemy.create_engine(f'sqlite:///homeserver.db')

# Global variable 
# A global variable will be populated on runtime.
# It is read from P2PRC directly or from a local
# database. 

# Node information
# Generated using: https://jsonformatter.org/json-to-python
@dataclass
class Node:
    Name: str
    MachineUsername: str
    IPV4: str
    IPV6: str
    Latency: int
    Download: int
    Upload: int
    ServerPort: str
    BareMetalSSHPort: str
    NAT: bool
    EscapeImplementation: str
    ProxyServer: bool
    UnSafeMode: bool
    PublicKey: str
    CustomInformation: str

@dataclass
class IPAddress:
    ip_address: List[Node]


# ----------------------------------------------------------------------------
# ----------------------------- Helper functions ----------------------------- 
# ----------------------------------------------------------------------------  

def StartServer():
    # Starting P2PRC as a server mode
    p2prc.Server()

# Class to create string to pass as string function 
# parameter to shared object file
class go_string(Structure):
    _fields_ = [
    ("p", c_char_p),
    ("n", c_int)]

# Ensuring local port can escape NAT and responds 
# with the public ip and port no.
# If the domain name is specified then the public IP 
# can be used as an A name entry.
def P2PRCMapPort(port="",domainname="",serveraddress=""):
    port = go_string(c_char_p(port.encode('utf-8')), len(port))
    domainname = go_string(c_char_p(domainname.encode('utf-8')), len(domainname))
    serveraddress = go_string(c_char_p(serveraddress.encode('utf-8')), len(serveraddress))

    # Defining the response type of the GoLang function 
    # function
    p2prc.MapPort.restype = c_char_p
    # Calling the Go function
    address = p2prc.MapPort(port,domainname,serveraddress)
    res = str(address).strip("b'")
    return res

# Lists all avaliable nodes in the network
def ListNodes():
    # View IP Table information 
    p2prc.ViewIPTable.restype = c_char_p
    ipTable = p2prc.ViewIPTable()
    # View IP Table as 
    ipTableObject = json.loads((str(ipTable).strip("b'")))
    dat: IPAddress = dacite.from_dict(IPAddress,ipTableObject)
    return dat

# Add a root node to P2RRC and overwrites all other nodes.
# To be only added before the network started and with
# the intention of a fresh protocol.
def AddRootNode(ip="", port="") -> bool:
    ip = go_string(c_char_p(ip.encode('utf-8')), len(ip))
    port = go_string(c_char_p(port.encode('utf-8')), len(port))

    p2prc.AddRootNode.restype = c_char_p
    res = p2prc.AddRootNode(ip, port)
    if str(res).strip("b'") == "Success":
        return True
    return False



# python function to pass-through custom
# information to interpret which can be
# interpreted as a DSL.
def AddCustomInformation(message="") -> bool:
    message = go_string(c_char_p(message.encode('utf-8')), len(message))

    p2prc.CustomInformation.restype = c_char_p
    status = p2prc.CustomInformation(message)
    if str(status).strip("b'") == "Success":
        return True
    return False
    

 
