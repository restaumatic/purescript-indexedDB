{-
Welcome to a Spago project!
You can edit this file as you like.

Need help? See the following resources:
- Spago documentation: https://github.com/purescript/spago
- Dhall language tour: https://docs.dhall-lang.org/tutorials/Language-Tour.html

When creating a new Spago project, you can use
`spago init --no-comments` or `spago init -C`
to generate this file without the comments in this block.
-}
{ name = "indexeddb"
, license = "MIT"
, repository = "https://github.com/intronic/purescript-indexeddb.git"
, dependencies =
  [ "aff"
  , "arrays"
  , "avar"
  , "control"
  , "datetime"
  , "effect"
  , "either"
  , "enums"
  , "exceptions"
  , "foldable-traversable"
  , "foreign"
  , "functions"
  , "identity"
  , "lists"
  , "maybe"
  , "nonempty"
  , "now"
  , "nullable"
  , "prelude"
  , "read"
  , "spec"
  , "spec-mocha"
  , "transformers"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
