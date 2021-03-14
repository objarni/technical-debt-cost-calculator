module Model exposing (..)



type Model
    = TechDebtData {numberOfDevs:Int, averageWage:Int}


type Msg
    = UpdateWage Int
    | UpdateDevs Int

