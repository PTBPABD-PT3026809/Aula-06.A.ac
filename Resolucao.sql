-- Questão 01: Crie as contas de usuário User_A, User_B, User_C, User_D e User_E.

-- Criar User_A 
CREATE USER User_A WITH PASSWORD = 'PT23820x';

-- Criar User_B
CREATE USER User_B WITH PASSWORD = 'PT23820x';

-- Criar User_C
CREATE USER User_C WITH PASSWORD = 'PT23820x';

-- Criar User_D
CREATE USER User_D WITH PASSWORD = 'PT23820x';

-- Criar User_E
CREATE USER User_E WITH PASSWORD = 'PT23820x';

-- Questão 02: Considere o esquema de banco de dados relacional university. O User_A poderá selecionar ou modificar qualquer relação, exceto CLASSROOM, e pode conceder qualquer um desses privilégios a outros usuários.

-- Conceder permissões SELECT, INSERT, UPDATE, DELETE com GRANT OPTION em todas as tabelas do schema dbo (assumindo university), exceto classroom.

GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.advisor TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.course TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.department TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.grade_points TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.instructor TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.prereq TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.section TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.student TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.takes TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.teaches TO User_A WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.time_slot TO User_A WITH GRANT OPTION;

-- Nota: Tabelas como endereco, pessoa, section_aula_05 não foram incluídas pois não parecem parte do university schema padrão.

-- Questão 03: Liste as permissões do User_A.

-- Consultar permissões do User_A
select  princ.name
,       princ.type_desc
,       perm.permission_name
,       perm.state_desc
,       perm.class_desc
,       object_name(perm.major_id) as ObjectName
from    sys.database_principals princ
left join sys.database_permissions perm
on      perm.grantee_principal_id = princ.principal_id
where princ.name = 'User_A'
order by princ.name;