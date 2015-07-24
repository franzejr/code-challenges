# goHiring

[![Build Status](https://travis-ci.org/franzejr/code-challenges.svg)](https://travis-ci.org/franzejr/code-challenges)
[![Code Climate](https://codeclimate.com/favicon.ico)](https://codeclimate.com/github/franzejr/code-challenges/compare/goHiring)


Simple RESTful API.

## Requirements

This API aims to be used in hiring processes.

This API is not yet completed. There are only some important aspects I consider interesting.

##### Models

* Company
	- Company has many vacancies
	- Company has many positions

*	Position
	- Has name and description

* Vacancy
	- Has many applicants
	- Belongs to a position

*	Applicant
	- Has many Vacancies

