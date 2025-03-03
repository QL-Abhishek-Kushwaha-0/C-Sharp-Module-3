	CREATE TABLE Hackers(
		hacker_id INT,
		name VARCHAR(40)
	);

	CREATE TABLE Challenges(
		challenge_id INT,
		hacker_id INT
	);

	INSERT INTO Hackers
	(hacker_id, name)
	VALUES
	(5077, 'Rose'),
	(21283, 'Angela'),
	(62743, 'Frank'),
	(88255, 'Patrick'),
	(96196, 'Lisa');

	INSERT INTO Challenges
	(challenge_id, hacker_id)
	VALUES
	(61654,5077),
	(58302,21283),
	(40587,88255),
	(29477,5077),
	(1220,21283),
	(69514,21283),
	(46561,62743),
	(58077,62743),
	(18483,88255),
	(76766,21283),
	(52382,5077),
	(74467,21283),
	(33625,96196),
	(26053,88255),
	(42665,62743),
	(12859,62743),
	(70094,21283),
	(34599,88255),
	(54680,88255),
	(61881,5077);

	-- Firstly we will create a common table comprising of both tables
	WITH CountOfChallenges AS(
		SELECT Hackers.hacker_id, name, COUNT(challenge_id) AS NoOfChallenges
		FROM Hackers INNER JOIN Challenges
		ON Hackers.hacker_id = Challenges.hacker_id
		GROUP BY Hackers.hacker_id, name
	)
	-- Now here we will extract required elements from combined table
	SELECT hacker_id, name, NoOfChallenges
	FROM CountOfChallenges
	WHERE NoOfChallenges = (SELECT MAX(NoOfChallenges) FROM CountOfChallenges)   -- Here we will extract one with highest no of challenges or the ones with single challenge
						OR NoOfChallenges IN (
							SELECT NoOfChallenges FROM CountOfChallenges
							GROUP BY NoOfChallenges
							HAVING COUNT(*) = 1
						)
	ORDER BY NoOfChallenges DESC, hacker_id;  -- Here we will sort them in the order of Challenges COunt and hacker id
	