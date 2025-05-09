-- Define routine events
local events = {
	{ start_time = "06:00", end_time = "06:30", task = "Wake up, meditate, and plan your day" },
	{ start_time = "06:30", end_time = "07:30", task = "Revise core concepts or read tech blogs" },
	{ start_time = "07:30", end_time = "09:30", task = "Work on Laravel tasks" },
	{ start_time = "09:30", end_time = "09:45", task = "Short break" },
	{ start_time = "09:45", end_time = "11:45", task = "Work on Go microservices" },
	{ start_time = "11:45", end_time = "12:45", task = "Lunch and relax" },
	{ start_time = "12:45", end_time = "14:45", task = "Build projects/apply learned skills" },
	{ start_time = "14:45", end_time = "15:00", task = "Short break" },
	{ start_time = "15:00", end_time = "16:00", task = "Networking or contributing to GitHub" },
	{ start_time = "16:00", end_time = "18:00", task = "Personal time or learning advanced topics" },
	{ start_time = "18:00", end_time = "18:30", task = "Review progress and plan for tomorrow" },
	{ start_time = "18:30", end_time = "20:00", task = "Relax or engage in hobbies" },
}

-- Get today's date in the required format
local os_date = os.date
local today = os_date("%Y%m%d")

-- Open file to write
local file = io.open("Daily_Routine.ics", "w")

-- Write iCalendar header
file:write("BEGIN:VCALENDAR\n")
file:write("VERSION:2.0\n")
file:write("CALSCALE:GREGORIAN\n")

-- Add events
for _, event in ipairs(events) do
	local uid = tostring(math.random(1000000, 9999999)) -- Unique ID for the event
	file:write("BEGIN:VEVENT\n")
	file:write("UID:" .. uid .. "@daily-routine\n")
	file:write("DTSTAMP:" .. today .. "T060000Z\n")
	file:write("DTSTART:" .. today .. "T" .. event.start_time:gsub(":", "") .. "00Z\n")
	file:write("DTEND:" .. today .. "T" .. event.end_time:gsub(":", "") .. "00Z\n")
	file:write("SUMMARY:" .. event.task .. "\n")
	file:write("RRULE:FREQ=DAILY\n")
	file:write("END:VEVENT\n")
end

-- Write iCalendar footer
file:write("END:VCALENDAR\n")

-- Close the file
file:close()

print("Daily_Routine.ics file created successfully!")
