SELECT U.username, C.*, GA.aid, GA.name, GA.body, GA.score, GA.points
FROM (
	SELECT grades.*, assignments.*
	FROM users, assignments, grades, entries
	WHERE ((grades.uid=users.uid) OR (entries.level > 0))
	AND (grades.aid=assignments.aid)
	AND (assignments.cid=entries.cid)
	AND (entries.uid=users.uid)
	AND (users.uid=:uid)
	AND (entries.cid=:cid)) AS GA
JOIN (
	SELECT *
	FROM users) AS U
ON GA.uid=U.uid
JOIN (
	SELECT *
	FROM courses) AS C
ON GA.cid=C.cid
ORDER BY GA.cid ASC, GA.gid ASC
