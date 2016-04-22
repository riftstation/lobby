/var/list/project_changelogs = list(
                                 'resources/changelogs/1.0.xml'
                             )

/world/name = "Lobby"

/proc/SendMessage(message)
	for (var/client/C)
		C << "[message]"

/proc/Sanitize(text)
	. = text

	. = html_encode(.)

/client/verb/Chat(var/message as text)
	set name = ">"

	if (message)
		SendMessage(text("<b>[]</b>: []", Sanitize(key), Sanitize(message)))

		database.Execute("INSERT INTO messages (id, type, author, message, created) VALUES($1, $2, $3, $4, CURRENT_TIMESTAMP)",
		                 CO.GenerateUniqueID(),
		                 "OOC",
		                 key,
		                 message)
