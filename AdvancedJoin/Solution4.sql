
--  4. https://www.hackerrank.com/challenges/interviews/problem

select c.contest_id, c.hacker_id, c.name, t1.s1, t1.s2, t2.s3, t2.s4 from Contests c left outer join
(select co.contest_id, sum(s.total_submissions) s1, sum(s.total_accepted_submissions) s2
from Colleges co inner join Challenges ch on co.college_id=ch.college_id left outer join Submission_Stats s on ch.challenge_id=s.challenge_id 
group by co.contest_id) t1 on c.contest_id=t1.contest_id
left outer join 
(select co.contest_id, sum(v.total_views) s3, sum(v.total_unique_views) s4
from Colleges co inner join Challenges ch on co.college_id=ch.college_id left outer join View_Stats v on ch.challenge_id=v.challenge_id
group by co.contest_id) t2 on c.contest_id=t2.contest_id
where t1.s1 is not null and t1.s2 is not null and t2.s3 is not null and t2.s4 is not null
order by c.contest_id;

