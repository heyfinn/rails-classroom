# Classroom
A backend api server for [vue-classroom](https://github.com/heyfinn/vue-classroom).

## Requirement
Ruby version >= 2.0.0

## Host
```
./bin/rails db:migrate
./bin/rails s
```

## API Served
### classroom
* GET `/api/classrooms` : load all classroom data
* GET `/api/classrooms/{classId}`: load students in clasasroom with `classId`
* PUT `/api/classrooms/{classId}`: update classroom data

### student
* GET `/api/students`: load all students
* GET `/api/students/{studentId}`: load student data with `studentId`
* PUT `/api/students/{studentId}`: update student data

### search
* GET `/api/search?keyword={keyword}`: search students and classrooms with `keyword` given
