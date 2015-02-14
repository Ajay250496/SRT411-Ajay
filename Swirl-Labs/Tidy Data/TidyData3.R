students
?gather
gather(students, sex,count,-grade)
students2
res <- gather(students2, sex_class, count, -grade)
res
?separate
separate(res, sex_class,c("sex","class"))
submit()
students3
submit()
students3
submit()
submit()
submit()
extract_numeric("class5")
submit()
?mutate
submit()
students4
submit()
passed
failed
passed <- mutate(passed, status = "passed")
failed <- mutate(failed, status = "failed")
bind_rows(passed,failed)
sat
?select
submit()
submit()
submit()
