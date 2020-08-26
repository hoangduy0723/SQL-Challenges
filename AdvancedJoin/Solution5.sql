-- 5. https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem

select s_min_id_1.submission_date, s_unique_num.unique_count, h.hacker_id, h.name from
(select submission_date, min(s_min_id.hacker_id) min_hacker_id, submit_count from
(select s_c.submission_date, s_c.hacker_id, s_c.submit_count from
(select submission_date, hacker_id, count(*) submit_count from Submissions 
group by submission_date, hacker_id) s_c,
(select c.submission_date, max(submit_count) max_submit_count from
(select submission_date, hacker_id, count(*) submit_count from Submissions 
group by submission_date, hacker_id) c
group by c.submission_date) s_max
where s_c.submission_date=s_max.submission_date and s_c.submit_count=s_max.max_submit_count) s_min_id
group by s_min_id.submission_date, s_min_id.submit_count) s_min_id_1, 
(select * from (select submission_date, count(DISTINCT hacker_id) unique_count from (select a.submission_date, v.hacker_id, count(DISTINCT v.submission_date) cnt from ( select DISTINCT submission_date from Submissions order by 1 ) a, submissions v where v.submission_date <= a.submission_date group by a.submission_date, v.hacker_id ) where TO_CHAR(submission_date,'DD') = cnt group by submission_date)) s_unique_num,
Hackers h
where s_min_id_1.min_hacker_id = h.hacker_id and s_min_id_1.submission_date=s_unique_num.submission_date
order by s_min_id_1.submission_date;