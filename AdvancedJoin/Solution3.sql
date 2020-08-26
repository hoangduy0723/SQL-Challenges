
-- 3. https://www.hackerrank.com/challenges/symmetric-pairs/problem


select distinct f1.x, f1.y from 
(select x, y, rownum r from functions) f1, 
(select x, y, rownum r from functions) f2
where f1.y=f2.x and f2.y=f1.x  and f1.r <> f2.r and f1.x<=f1.y order by f1.x;

