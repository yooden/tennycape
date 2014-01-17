--  river/db/river-create.sql
--
--  DB creation script for River.
--
--  This might be short-lived and replaced with some Rails stuff soon.

drop table role
create table role
(
    id          serial primary key,
    name        varchar(255)
);
--  TODO at the moment we only have user->auditor->admin, so maybe we can
--  simplify things to a single field in table user.

drop table user;
create table user
(
    id          serial primary key,
    name        varchar(255),
    password    varchar(255)
);

drop table user_role
create table user_role
(
    user        integer references user id on delete cascade,
    role        integer references role id on delete cascade
);
--  TODO add unique contraint

drop table venue;
create table venue
(
    id          serial primary key,
    name        varchar(255) not null check (name <> ''),
    address     integer references address id,
    size        integer
);

drop table artist
create table artist
(
    id          serial primary key,
    name        varchar(255) not null check (name <> '')
);

drop table event
create table event
(
    id          serial primary key,
    name        varchar(255),       --  only used for multiple-artists events
    venue       integer references venue id on delete cascade,
    artist      integer references artist id on delete cascade,
    date        timestamp with time zone,
    reference   text                --  store source for the event
);

drop table address
create table address
(
    id          serial primary key,
    coordinates varchar(255),       -- cf. earthdistance
    street      varchar(255),
    city        varchar(255),
    zip         varchar(10),
    country     varchar(255)
);

--  TODOS:
--  - Festivals with multiple artists: Either 1:n for event.artist or
--    extension of event containing multiple events.
--  - Festivals with multiple venues
--  - Artist images. Probably the best to just get them from Wikimedia.
