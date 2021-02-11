PL/SQ Para Atividades DBA Oracle

Verificação da Existência de Usuários
======================================

SET SERVEROUTPUT ON
DECLARE
    USERNAME  DBA_USERS.USERNAME%type;
begin
    select USERNAME
into USERNAME
from DBA_USERS
where USERNAME='SYS';
dbms_output.put_line('Usuário : '|| USERNAME);
    exception
    when no_data_found then
    dbms_output.put_line('-------------------------');
    dbms_output.put_line('Usuario não encontrado   ');
    dbms_output.put_line('-------------------------');
end;
/

Montagem de Script para troca de Senhas
========================================

SET SERVEROUTPUT ON
DECLARE
    USERNAME  DBA_USERS.USERNAME%type;
begin
    select USERNAME
into USERNAME
from DBA_USERS
where USERNAME IN ('SYS');
dbms_output.put_line('alter user '|| USERNAME || ' identified by '|| USERNAME||';');
    exception
    when no_data_found then
    dbms_output.put_line('-------------------------');
    dbms_output.put_line('Usuario não encontrado   ');
    dbms_output.put_line('-------------------------');
end;
/

Identificação de Objetos com PL/SQL
====================================

set serveroutput on;
BEGIN
  FOR record IN
  (SELECT object_name, owner,object_type, LAST_DDL_TIME,status
    FROM
      dba_objects 
      WHERE object_name in ('exemplo1','exemplo'))
   loop
   dbms_output.put_line( 'owner = '|| record.owner||' ==> '||record.object_name|| '  Tipo de Objeto = '||record.object_type|| ' LAST_DDL_TIME ==> '||record.LAST_DDL_TIME|| '  Status do objeto ==> '||record.status );
end loop;
end;
/

