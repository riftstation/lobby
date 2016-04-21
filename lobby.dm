/client/verb/OOC(msg as text)


	//log_ooc("[mob.name]/[key] : [raw_msg]") - Something from the /tg/ code that we might want later.
	var/pkey = key
	if (lentext(msg)>0)
	{
		world << "[pkey] : [msg]"
	}



