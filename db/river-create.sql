$Id: $
$HeadURL: $

drop table meta;
create table meta
(
    key     varchar(255),
    value   varchar(255)
);
insert into meta (key, value)
values ('revision', '$Revision: $');

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

drop table gig
create table gig
(
    id          serial primary key,
    venue       integer references venue id on delete cascade,
    artist      integer references artist id on delete cascade,
    date        timestamp with time zone
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
