DELIMITER %

CREATE PROCEDURE insert_employee_proc(
	in Fname_p VARCHAR(15),
	in Minit_p CHAR(1),
	in Lname_p VARCHAR(15),
	in Ssn_p CHAR(9),
	in Bdate_p DATE,
	in Address_p VARCHAR(30),
	in Sex_p CHAR(1),
	in Salary_p DECIMAL(10, 2),
	in Super_ssn_p CHAR(9),
	in Dno_p INT
)

BEGIN
	INSERT INTO employee (Fname_p, Minit_p, Lname_p, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
	VALUES (Fname_p, Minit_p, Lname_p, Ssn_p, Bdate_p, Address_p, Sex_p, Salary_p, Super_ssn_p, Dno_p);

	SELECT * FROM employee;
END %

DELIMITER ;

DESC employee;

CALL insert_employee_proc(
	'Amanda', 'B', 'Teixeira', '123769824', '1990-08-10', '791-Fondren-Houston-TX', 'F', '40000.00', '123456789', '1'
);

SELECT * FROM employee;

CREATE DATABASE teste_proc;

USE teste_proc;

DROP TABLE user;

CREATE TABLE user(
	id in auto_increment primary key,
	nome VARCHAR(20) NOT NULL UNIQUE,
	email VARCHAR(30) NOT NULL,
	senha VARCHAR(60) NOT NULL,
	data_cadastro DATETIME
);

DESC user;

DROP PROCEDURE procedure_insert;

DELIMITER \\

CREATE PROCEDURE procedure_insert(
	in nome_p VARCHAR(20),
	in email_p VARCHAR(30),
	in senha_p VARCHAR(60)
)
BEGIN
	IF (lenght(senha_p) < 10 AND lenght(senha_p) > 7) THEN
		INSERT INTO user (nome, email, senha, data_cadastro) VALUES (nome_p, email_p, md5(senha_p), now());
		SELECT * FROM user;
	ELSE
		SELECT 'Forneca outra senha' AS Message_error;
	END IF;
END \\

DELIMITER ;

CALL procedure_insert ('Marcia', 'marcia@email.com', '123456789');

SELECT md5('123456789') AS senha;
