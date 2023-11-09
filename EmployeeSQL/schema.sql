-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

CREATE TABLE "titles" (
    "title_id" VARCHAR(30) PRIMARY KEY NOT NULL,
    "title" VARCHAR(30) NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INTEGER PRIMARY KEY NOT NULL,
    "title_id" VARCHAR(30) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "sex" CHAR NOT NULL,
    "hire_date" DATE NOT NULL,
	foreign key (title_id) references titles (title_id)
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(30) PRIMARY KEY NOT NULL,
    "dept_name" VARCHAR(30) NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER NOT NULL,
    "dept_no" VARCHAR(30) NOT NULL,
	PRIMARY KEY ("emp_no", "dept_no"),
    foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(30) NOT NULL,
    "emp_no" INTEGER NOT NULL,
	PRIMARY KEY ("emp_no", "dept_no"),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER PRIMARY KEY NOT NULL,
    "salary" INTEGER NOT NULL,
	foreign key (emp_no) references employees (emp_no)
);

SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

