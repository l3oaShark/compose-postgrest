#!/bin/bash

psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} <<-END
    CREATE USER ${DB_ANON_ROLE};
    GRANT USAGE ON SCHEMA ${DB_SCHEMA} TO ${DB_ANON_ROLE};
    ALTER DEFAULT PRIVILEGES IN SCHEMA ${DB_SCHEMA} GRANT SELECT ON TABLES TO ${DB_ANON_ROLE};
    GRANT SELECT ON ALL SEQUENCES IN SCHEMA ${DB_SCHEMA} TO ${DB_ANON_ROLE};
    GRANT SELECT ON ALL TABLES IN SCHEMA ${DB_SCHEMA} TO ${DB_ANON_ROLE};
END

