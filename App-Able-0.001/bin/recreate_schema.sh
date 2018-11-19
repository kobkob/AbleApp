#!/bin/sh
rm -Rf ./lib/App/Able/Schema
dbicdump -o dump_directory=lib App::Able::Schema dbi:SQLite:assets/db_default.db
