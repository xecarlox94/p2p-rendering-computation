
module Main where

import P2PRC
  ( runP2PRC
  , MapPortRequest(MkMapPortRequest), ServerInfo (latency)
  )

import GHC.Base (List)


main :: IO ()
main =
  runP2PRC
    ( MkMapPortRequest 8080 "jose.akilan.io"
    )


{-
-- Rationale behind 
-- (ProcessNetwork context) => NetworkApplication
-}
-- Distributed application
-- describes relationships between processes
data ProcessNetwork a
  = NetworkJoin (ProcessNetwork a) (ProcessNetwork a)
  | MkNetworkProcess a

data NetworkApplicationConfig 
  --
  -- Description of networked application maanged by the current orchestrator
  -- Network application description


type P2PRCNetworkState = (List ProcessState, List NodeInfo) -- P2PRC state 

orchestrateNetworkApplication
  :: NetworkApplicationConfig 
  -> P2PRCNetworkState        -- represents P2PRC available resources
  -> 
    ( P2PRCNetworkState
    , ResultYetToSpecialise NetworkApplicationConfig
    )

-- TODO: Finish documentation
--
--  According with a ProcessNetwork, this function will:
--    - scale resources up and down
--

orchestrateNetworkApplication = undefined


-- This is the information parsed from p2prc "ls" command
--
-- This will data serialised by the orchestrator to bootstrap and maintain current network application
--
data P2PRCNetworkState where
  MkP2PRCProcessesList :: List ProcessState -> P2PRCNetworkState

-- this will represent the current process state
--
-- This state will be resultant from the execution of the process on the target node
--
data ProcessState where
  RunningProcessState   :: NodeInfo -> ProcessState     -- this will update the orchestrator of the process' progress
  FinishedProcessState  :: NodeInfo -> ProcessState     -- This will report the orchestrator of the process' resolution
  CrashedProcessState   :: NodeInfo -> ProcessState     -- This will report crash status to the orchestrator
  BootstrapingProcess   :: NodeInfo -> ProcessState     -- This will mark this as a bootstrapping process


data NodeInfo
-- this is the relevant p2prc information, incoming from p2prc "ls" command
--
-- latency
-- List (processes, resources taken)
-- etc...

data ProcStartEnv                     
  -- Represents the target node environment
  -- Machine characteristics:   OS, Arch
  -- Node Session:              Environment Variables and necessary keys
  -- Process Command:           executable [args] [opts]

data RunningProcess
  -- Represents the target node running environment
  -- 
  --    TODO: document this
  --
  --

data ProcRunningEnv
  --    TODO: document this
  --
  --

data FinishedProcess
  --    TODO: document this
  --
  --



data ProcessConfig where
  MkProcess :: 
    { startProcess      :: ProcStartEnv -> ResultYetToSpecialise RunningProcess 
    -- TODO: document this
    --
    --
    , stopProcess       :: ProcRunningEnv -> ResultYetToSpecialise ()
    -- TODO: document this
    --
    --
    , onCrash           :: Crash -> CrashReaction
    -- TODO: document this
    --
    --
    --
    --
    -- TODO: the following will be implemented after state machine changing functions are fully implemented
    --
    -- This functionality represents very important aspects
    --
    -- , streamingSocket :: Maybe ( NetworkState -> ((IO process), IO p2prc)
    --    
    --    This feature will declare how the node can react internally to its inner working and towards its host node. 
    --    Yet to design ...
    --    
    --
    -- , backupPolicy      :: undefined       
    --    TODO: document this
    --
    --
    -- , transferProcess   :: undefined
    --    TODO: document this
    --
    --
    -- , dependencies      :: undefined
    --    TODO: document this
    --
    --
    --
    --
    -- TODO: develop data type architecture further, it will take a bit more time
    --
    -- Design of Process Configuration and Policies
    --
    -- Draft perhaps this is a better interface to define process
    -- data ProcessPolicies where
    --   MkProcessPolicies :: 
    --   -> MkProcessPolicies
    --
    --
    -- Process Configuration
    --
    --
    --
    } 
    -> ProcessConfig

-- This represents any kind of crash and how the process will react to it
data Crash 
  = ProcessCrash          -- process crash event
  | NodeCrash             -- node crash event
  | NetworkCrash          -- network complete failure

-- This represent the reaction to a any kind of crash, this is to be declared in the orchestration level
data CrashReaction

data CustomInformation where            -- P2PRC node information field

  -- TODO: yet to implement typeclasses for serialisation
  --
  -- This data type is serialisable and deserialisable
  --

  MkCustomInformation 
    :: AdditionalCustomInformation      -- Additional information defined by the user
    -> ProcessState                     -- Current ProcessState
    -> ProcessConfig                    -- Process full configuration
      -> CustomInformation



-- Auxiliar and Temporary Data types
--
-- To be removed/improved
--
--
-- Result Types yet to specialise
type ErrorYetToSpecialise = String
type ResultYetToSpecialise a = Either ErrorYetToSpecialise a
--
--  Contains all other information that the user intend to persist on node environment
--
type AdditionalCustomInformation = String 
