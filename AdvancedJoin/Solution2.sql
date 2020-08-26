
-- 2. https://www.hackerrank.com/challenges/placements/problem


select s.name from Friends f, Packages p, Packages pf, Students s
where f.id=p.id and f.friend_id=pf.id and pf.salary>p.salary and f.id=s.id
order by pf.salary;

