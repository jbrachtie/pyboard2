DROP TABLE IF EXISTS users;
CREATE TABLE users (
	uid INTEGER PRIMARY KEY AUTOINCREMENT,
	username TEXT UNIQUE NOT NULL,
	name TEXT NOT NULL,
	email TEXT NOT NULL
);

drop table if exists courses;
CREATE TABLE courses (
	cid INTEGER PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL
);

DROP TABLE IF EXISTS entries;
CREATE TABLE entries (
	eid INTEGER PRIMARY KEY AUTOINCREMENT,
	uid INTEGER NOT NULL,
	cid INTEGER NOT NULL,
	level INTEGER DEFAULT 0,

	FOREIGN KEY(uid) REFERENCES users(uid),
	FOREIGN KEY(cid) REFERENCES courses(cid)
);

DROP TABLE IF EXISTS assignments;
CREATE TABLE assignments (
	aid INTEGER PRIMARY KEY AUTOINCREMENT,
	cid INTEGER NOT NULL,
	points INTEGER NOT NULL,
	name TEXT NOT NULL,
	body TEXT NOT NULL,
	due INTEGER DEFAULT 0,

	FOREIGN KEY(cid) REFERENCES courses(cid)
);

DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
	gid INTEGER PRIMARY KEY AUTOINCREMENT,
	uid INTEGER NOT NULL,
	aid INTEGER NOT NULL,
	timestamp INTEGER NOT NULL,
	score INTEGER NOT NULL,
	message TEXT,

	FOREIGN KEY(uid) REFERENCES users(uid),
	FOREIGN KEY(aid) REFERENCES assignments(aid)
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
	mid INTEGER PRIMARY KEY AUTOINCREMENT,
	cid INTEGER NOT NULL,
	timestamp INTEGER NOT NULL,
	title TEXT NOT NULL,
	body TEXT NOT NULL,

	FOREIGN KEY(cid) REFERENCES courses(cid)
);
