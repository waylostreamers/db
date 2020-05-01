create table roles
(
    role_id          serial not null
        constraint roles_pk
            primary key,
    role_description varchar
);

alter table roles
    owner to postgres;

create unique index roles_role_id_uindex
    on roles (role_id);

create table contributors
(
    artist_id      integer,
    role_id        integer,
    contributor_id serial not null
        constraint contributors_pk
            primary key
);

alter table contributors
    owner to postgres;

create unique index contributors_contributor_id_uindex
    on contributors (contributor_id);

create table genres
(
    genre_name varchar,
    genre_id   serial not null
        constraint genres_pk
            primary key
);

alter table genres
    owner to postgres;

create unique index genres_genre_id_uindex
    on genres (genre_id);

create table locations
(
    location_id serial not null
        constraint locations_pk
            primary key,
    address_one varchar,
    address_two varchar,
    country     varchar,
    zip_code    varchar,
    city        varchar,
    coords      varchar
);

alter table locations
    owner to postgres;

create table users
(
    email      varchar not null,
    user_id    serial  not null
        constraint users_pk
            primary key,
    first_name varchar not null,
    last_name  varchar not null,
    location   integer
        constraint users_locations_location_id_fk
            references locations
);

alter table users
    owner to postgres;

create unique index users_user_id_uindex
    on users (user_id);

create table artists
(
    artist_id        serial not null
        constraint artists_pk
            primary key,
    artwork          uuid,
    artist_owner     integer
        constraint artists_users_user_id_fk
            references users,
    birth_date       date,
    birth_location   integer,
    current_location integer,
    gender           varchar,
    nationality      varchar,
    artist_url       varchar,
    external_urls    character varying[]
);

alter table artists
    owner to postgres;

create unique index artists_artist_id_uindex
    on artists (artist_id);

create table tracks
(
    isrc                              varchar not null,
    title                             varchar,
    track_url                         varchar,
    track_owner                       integer
        constraint tracks_users_user_id_fk
            references users,
    purchase_cost                     numeric not null,
    stream_cost                       numeric not null,
    purchase_count                    bigint,
    stream_count                      bigint,
    track_credits                     text,
    artwork_id                        uuid,
    genres                            text,
    technical_sound_recording_details text,
    track_id                          serial  not null
        constraint tracks_pk
            primary key
);

alter table tracks
    owner to postgres;

create unique index tracks_isrc_uindex
    on tracks (isrc);

create unique index tracks_track_id_uindex
    on tracks (track_id);

create table albums
(
    album_id          serial not null
        constraint albums_pk
            primary key,
    upc               integer,
    title             varchar,
    release_date      date,
    upload_date       date,
    remaster_date     date,
    start_date_time   date,
    artwork_id        uuid,
    purchase_cost     numeric,
    purchase_count    numeric,
    label_name        varchar,
    album_credits     text,
    available_markets char[],
    album_owner       integer
        constraint albums_users_user_id_fk
            references users
);

alter table albums
    owner to postgres;

create unique index albums_album_id_uindex
    on albums (album_id);

create table rights_agreements
(
    agreement_id    serial not null
        constraint rights_agreements_pk
            primary key
        constraint rights_agreements_users_user_id_fk
            references users,
    agreement_name  varchar,
    agreement_text  text,
    agreement_url   text,
    agreement_date  date,
    agreement_owner integer
);

alter table rights_agreements
    owner to postgres;

create unique index rights_agreements_agreement_id_uindex
    on rights_agreements (agreement_id);

create unique index locations_location_id_uindex
    on locations (location_id);

create table tracks_contributors
(
    tracks_contributors_id serial not null
        constraint tracks_contributors_pk
            primary key
        constraint tracks_contributors_contributors_contributor_id_fk
            references contributors
        constraint tracks_contributors_tracks_track_id_fk
            references tracks
);

alter table tracks_contributors
    owner to postgres;

create unique index tracks_contributors_tracks_contributors_id_uindex
    on tracks_contributors (tracks_contributors_id);

create table albums_contributors
(
    albums_contributors_id serial not null
        constraint albums_contributors_pk
            primary key
        constraint albums_contributors_albums_album_id_fk
            references albums
        constraint albums_contributors_contributors_contributor_id_fk
            references contributors
);

alter table albums_contributors
    owner to postgres;

create unique index albums_contributors_albums_contributors_id_uindex
    on albums_contributors (albums_contributors_id);

create table albums_tracks
(
    album_track_id serial not null
        constraint albums_tracks_pk
            primary key
        constraint albums_tracks_albums_album_id_fk
            references albums
        constraint albums_tracks_tracks_track_id_fk
            references tracks
);

alter table albums_tracks
    owner to postgres;

create unique index albums_tracks_album_track_id_uindex
    on albums_tracks (album_track_id);

create table albums_genres
(
    albums_genres_id serial not null
        constraint albums_genres_pk
            primary key
        constraint albums_genres_albums_album_id_fk
            references albums
        constraint albums_genres_genres_genre_id_fk
            references genres
);

alter table albums_genres
    owner to postgres;

create unique index albums_genres_albums_genres_id_uindex
    on albums_genres (albums_genres_id);

create table tracks_genres
(
    tracks_genres_id serial not null
        constraint tracks_genres_pk
            primary key
        constraint tracks_genres_genres_genre_id_fk
            references genres
        constraint tracks_genres_tracks_track_id_fk
            references tracks
);

alter table tracks_genres
    owner to postgres;

create unique index tracks_genres_tracks_genres_id_uindex
    on tracks_genres (tracks_genres_id);

create table albums_rights_agreements
(
    album_rights_agreements_id serial not null
        constraint albums_rights_agreements_albums_album_id_fk
            references albums
        constraint albums_rights_agreements_rights_agreements_agreement_id_fk
            references rights_agreements
);

alter table albums_rights_agreements
    owner to postgres;


