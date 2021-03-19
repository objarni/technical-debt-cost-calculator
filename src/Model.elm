module Model exposing (..)


type Model
    = TechDebtData
        { numberOfDevs : Int
        , averageWage : Int
        , unplannedPercent : Int
        }


type Msg
    = UpdateWage Int
    | UpdateDevs Int
    | UpdateUnplanned Int
