SELECT A.*, C.*
FROM (
	SELECT assignments.*
	FROM assignments, entries
	WHERE (assignments.cid=entries.cid)
	AND (assignments.due > strftime('%s', 'now'))
	AND (entries.uid=:uid)) AS A
JOIN (
	SELECT cid, name
	FROM courses) AS C
ON A.cid=C.cid
ORDER BY A.name ASC
