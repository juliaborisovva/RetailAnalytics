CREATE ROLE Administrator;
CREATE ROLE Visitor;

-- Administrator
GRANT CONNECT ON DATABASE main TO Administrator;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO Administrator;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO Administrator;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO Administrator;

-- Visitor
GRANT CONNECT ON DATABASE main TO Visitor;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO Visitor;

-- просто глянуть
SELECT rolname
FROM pg_roles
WHERE rolname = 'administrator'
   OR rolname = 'visitor';

SELECT grantor, grantee, table_schema, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee = 'administrator';

SELECT grantor, grantee, table_schema, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee = 'visitor';

-- удаление
--REASSIGN OWNED BY Administrator TO postgres;
--DROP OWNED BY Administrator;
--DROP ROLE Administrator;

--REASSIGN OWNED BY Visitor TO postgres;
--DROP OWNED BY Visitor;
--DROP ROLE Visitor;