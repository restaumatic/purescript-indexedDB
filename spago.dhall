{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "indexeddb"
, dependencies =
    [ "aff"
    , "avar"
    , "console"
    , "datetime"
    , "effect"
    , "exceptions"
    , "foreign"
    , "maybe"
    , "now"
    , "nullable"
    , "prelude"
    , "spec"
    , "spec-mocha"
    , "psci-support"
    , "read"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
