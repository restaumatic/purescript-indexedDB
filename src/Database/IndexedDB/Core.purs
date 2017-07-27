-- | The Core module gathers types used across the library and provides basic Show instances for
-- | those types.
-- |
-- | NOTE:
-- | Errors normally thrown by the IDB* interfaces are wrapped in the `Aff` Monad as `Error`
-- | where the `message` corresponds to the error's name (e.g. "InvalidStateError").
-- | Pattern matching can therefore be done on any error message to handle specific errors thrown
-- | by the API.

module Database.IndexedDB.Core
  ( IDB
  , CursorSource(..)
  , Database
  , Index
  , KeyRange
  , KeyPath
  , ObjectStore
  , Transaction
  , TransactionMode(..)
  , module Database.IndexedDB.IDBKey
  ) where

import Prelude                     (class Show)

import Control.Monad.Eff           (kind Effect)
import Data.Maybe                  (Maybe(..))
import Data.String.Read            (class Read)

import Database.IndexedDB.IDBKey

-- | IDB Effects, manifestation that something happened with the IndexedDB
foreign import data IDB :: Effect


-- | If the source of a cursor is an object store, the effective object store of
-- | the cursor is that object store and the effective key of the cursor is the
-- | cursor’s position. If the source of a cursor is an index, the effective object
-- | store of the cursor is that index’s referenced object store and the effective key
-- | is the cursor’s object store position.
data CursorSource
  = ObjectStore ObjectStore
  | Index Index


-- | A transaction has a mode that determines which types of interactions can be performed
-- | upon that transaction. The mode is set when the transaction is created and remains
-- | fixed for the life of the transaction.
data TransactionMode
  = ReadOnly        -- ^ The transaction is only allowed to read data.
  | ReadWrite       -- ^ The transaction is allowed to read, modify and delete data from existing object stores
  | VersionChange   -- ^ The transaction is allowed to read, modify and delete data from existing object stores, and can also create and remove object stores and indexes.



-- | A key path is a list of strings that defines how to extract a key from a value.
-- | A valid key path is one of:
-- |
-- | - An empty list.
-- | - An singleton identifier, which is a string matching the IdentifierName production from the ECMAScript Language Specification [ECMA-262].
-- | - A singleton string consisting of two or more identifiers separated by periods (U+002E FULL STOP).
-- | - A non-empty list containing only strings conforming to the above requirements.
type KeyPath = Array String


-- | Each origin has an associated set of databases. A database has zero or more object
-- | stores which hold the data stored in the database.
foreign import data Database :: Type

-- | An index allows looking up records in an object store using properties of the values
-- | in the object stores records.
foreign import data Index :: Type


-- | A key range is a continuous interval over some data type used for keys.
foreign import data KeyRange :: Type


-- | An object store is the primary storage mechanism for storing data in a database.
foreign import data ObjectStore :: Type


-- | A Transaction is used to interact with the data in a database.
-- | Whenever data is read or written to the database it is done by using a transaction.
foreign import data Transaction :: Type


foreign import _showDatabase
  :: Database
  -> String
instance showDatabase :: Show Database where
  show = _showDatabase


foreign import _showIndex
  :: Index
  -> String
instance showIndex :: Show Index where
  show = _showIndex


foreign import _showKeyRange
  :: KeyRange
  -> String
instance showKeyRange :: Show KeyRange where
  show = _showKeyRange


foreign import _showObjectStore
  :: ObjectStore
  -> String
instance showObjectStore :: Show ObjectStore where
  show = _showObjectStore


foreign import _showTransaction
  :: Transaction
  -> String
instance showTransaction :: Show Transaction where
  show = _showTransaction


instance showTransactionMode :: Show TransactionMode where
  show x =
    case x of
      ReadOnly      -> "readonly"
      ReadWrite     -> "readwrite"
      VersionChange -> "versionchange"


instance readTransactionMode :: Read TransactionMode where
  read s =
    case s of
      "readonly"      -> Just ReadOnly
      "readwrite"     -> Just ReadWrite
      "versionchange" -> Just VersionChange
      _               -> Nothing
