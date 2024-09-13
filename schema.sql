create table titles(
	title_id varchar not null,
	title varchar not null,
	primary key (title_id)
);

create table employees(
	emp_no int not null,
	emp_title_id varchar not null,
	birth_date date, 
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date date not null,
	Foreign Key (emp_title_id) references  titles(title_id),
	primary key (emp_no)
);

create table departments(
	dept_no varchar not null,
	dept_name varchar not null,
	primary key (dept_no)
);



create table dept_manager(
	dept_no varchar not null,
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no),
	primary key (dept_no, emp_no)
);


create table dept_emp(
	emp_no int not null,
	dept_no varchar not null,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no),
	primary key (emp_no, dept_no)
);

create table salaries(
	emp_no int not null,
	salary int not null,
	foreign key(emp_no) references employees(emp_no),
	primary key (emp_no)
);

select emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
from employees as emp
	left join salaries as sal
	on emp.emp_no = sal.emp_no
order by emp.emp_no;


select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' And '1986-12-31';

select dem.dept_no, dp.dept_name, dem.emp_no,em.last_name, em.first_name
from dept_manager as dem
inner join departments as dp
on (dem.dept_no = dp.dept_no)
inner join employees as em
on (dem.emp_no = em.emp_no)