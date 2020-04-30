# db

'''
DDEX metadata format 
• <TerritoryCode> ISO territory code plus a DDEX code
 for “Worldwide”;
• <Title> - A composite element for title of the sound recording.
	 	 DDEX allows for many different kinds of titles. This element takes
 an attribute to identify the type of title being provided, i.e.
 “FormalTitle,” “DisplayTitle,” or “AbbreviatedDisplayTitle”;
• <DisplayArtist> - A composite element used to specify the artist
 associated with each sound recording. It includes elements to
	 	 specify an artist’s name as well as an optional <ArtistRole> element;
• <ResourceContributor> - DDEX includes the concept of a
	 	 contributor. This field can be used to list contributing artists such
 as guest rappers, soloists, etc;
• <LabelName> - An element for the label name;
• <PLine> - A composite element that identifies the year of first
 release of the Resource or Release followed by the name of the
 entity that owns the phonographic rights in the Resource or
 Release;
• <Genre> - A composite element used to specify genre
 information;
• <ParentalWarningType> - The element used to identify whether
	 	 the file includes explicit content or not;
• <TechnicalSoundRecordingDetails> - A composite element that
	 	 includes all the technical details about an audio file, such as the
 codec, bit rate, number of channels, etc. This element also contains
	 	 the file name and hash sum of the file; and
• <IsPreview> - Indication of whether the Resource is a preview
	 	 of an associated full Resource. <Video>.

'''

Database files for WAYLOSTREAMS 

ARTISTS : this is just the string associated with an album it is not a person : 
Artist id 
Artist name 

PEOPLE : can be a label contact , a performer, composer , user 
First name 
Last name 
Location
DOB 
Gender 


LABELS: 
Label owner
Label contact 
Location 


ALBUMS

 `album_id` int(100) NOT NULL,
  `album_title` varchar(100) NOT NULL,
  `album_artist` int(100) NOT NULL,
  `release_date` date NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `credits` varchar(10000) NOT NULL,
  `uploader` varchar(100) NOT NULL


TRACKS

`id` int(100) NOT NULL,
 `title` varchar(100) NOT NULL,
 `purchase_cost` int(50) NOT NULL,
 `stream_cost` int(50) NOT NULL,
 `URL` varchar(100) NOT NULL,
 `artist` int(100) NOT NULL,
Uploader 


PLAYLISTS 
Playlist id 
Playlist array eg [ trackid, trackid, albumid ] 
Playlist name 
Playlist creator ( personid ) 


PERFORMERS
performer id 
Performer name 
Person id 

COMPOSERS 
composer id 
composer name 
person id 

STREAMS 

 `stream_id` int(255) NOT NULL,
 `user_id` int(255) NOT NULL,
 `song_id` int(255) NOT NULL,
 `purchase_cost` int(255) NOT NULL,
 `number_plays` int(255) NOT NULL,
 `unpaid_plays` int(100) NOT NULL,
 `last_payment_date` date DEFAULT NULL,
 `first_access_time` date NOT NULL,
 `last_access_time` date NOT NULL


USERS 

 `id` int(11) NOT NULL,
 username 
 date joined 
 first purchase 
 last purchase 
 credits 
 spent credits 
 















PERSONS


 `email` varchar(100) NOT NULL,
 `password` varchar(100) NOT NULL,
 `hash` varchar(32) NOT NULL,
 `active` tinyint(1) NOT NULL DEFAULT '0',
 `credits` int(11) NOT NULL,
 `isPaused` int(11) NOT NULL DEFAULT '0',
 `lastPlayed` int(11) NOT NULL DEFAULT '0',
 `freeCreditBool` int(100) NOT NULL DEFAULT '0'
Current location 
Birth location 
DOB 










LOCATIONS 

Address 1 
Address 2 
Country 
City 
Coords 
Phone number 




