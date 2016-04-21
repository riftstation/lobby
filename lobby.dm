/world/name = "Lobby"

/proc/SendMessage(message)
	for (var/client/C)
		C << "[message]"

/proc/Sanitize(text)
	. = text

	. = html_encode(.)

/client/verb/Chat(var/msg as text)
	set name = ">"

	if (msg)
		SendMessage("<b>[key]</b>: [Sanitize(msg)]")
