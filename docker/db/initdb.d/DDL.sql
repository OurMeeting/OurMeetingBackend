create database if not exists our_meeting;

use our_meeting;

create table meeting
(
    id                 bigint       not null auto_increment,
    meeting_room_id    bigint       not null,
    name               varchar(255) not null,
    description        varchar(2000) not null,
    meeting_type       varchar(25) not null,
    start_date_time    datetime(6)  not null,
    end_date_time      datetime(6)  not null,
    created_date       datetime(6)  not null,
    last_modified_date datetime(6)  not null,
    created_by         varchar(45) not null,
    last_modified_by   varchar(45) not null,
    use_yn             char(1)      not null,
    primary key (id)
);

create table meeting_room
(
    id                 bigint       not null auto_increment,
    name               varchar(255) not null,
    description        varchar(1000) not null,
    location           varchar(255) not null,
    capacity           integer      not null,
    created_date       datetime(6)  not null,
    last_modified_date datetime(6)  not null,
    created_by         varchar(45) not null,
    last_modified_by   varchar(45) not null,
    use_yn             char(1)      not null,
    primary key (id)
);



create table meeting_room_bookmark
(
    id                 bigint       not null auto_increment,
    member_id          bigint       not null,
    meeting_room_id    bigint       not null,
    created_date       datetime(6)  not null,
    last_modified_date datetime(6)  not null,
    created_by         varchar(45) not null,
    last_modified_by   varchar(45) not null,
    use_yn             char(1)      not null,
    primary key (id)
);



create table meeting_room_equipment
(
    id                 bigint       not null auto_increment,
    meeting_room_id    bigint       not null,
    equipment          varchar(25) not null,
    count              integer      not null,
    created_date       datetime(6)  not null,
    last_modified_date datetime(6)  not null,
    created_by         varchar(45) not null,
    last_modified_by   varchar(45) not null,
    use_yn             char(1)      not null,
    primary key (id)
);



create table meeting_room_image
(
    id                 bigint       not null auto_increment,
    meeting_room_id    bigint       not null,
    origin_name        varchar(255) not null,
    stored_name        varchar(255) not null,
    ext                varchar(25) not null,
    created_date       datetime(6)  not null,
    last_modified_date datetime(6)  not null,
    created_by         varchar(45) not null,
    last_modified_by   varchar(45) not null,
    use_yn             char(1)      not null,
    primary key (id)
);



create table member
(
    id                 bigint       not null auto_increment,
    team_id            bigint,
    username           varchar(45) not null,
    password           varchar(255) not null,
    name               varchar(25) not null,
    created_date       datetime(6)  not null,
    last_modified_date datetime(6)  not null,
    created_by         varchar(45) not null,
    last_modified_by   varchar(45) not null,
    use_yn             char(1)      not null,
    primary key (id)
);



create table member_meeting
(
    id                 bigint       not null auto_increment,
    member_id          bigint       not null,
    meeting_id         bigint       not null,
    created_date       datetime(6)  not null,
    last_modified_date datetime(6)  not null,
    created_by         varchar(45) not null,
    last_modified_by   varchar(45) not null,
    use_yn             char(1)      not null,
    primary key (id)
);

create table team
(
    id                 bigint       not null auto_increment,
    name               varchar(25) not null,
    created_date       datetime(6)  not null,
    last_modified_date datetime(6)  not null,
    created_by         varchar(45) not null,
    last_modified_by   varchar(45) not null,
    use_yn             char(1)      not null,
    primary key (id)
);

alter table member
    add constraint UK_member_username unique (username);

alter table meeting
    add constraint FK_meeting_meeting_room
    foreign key (meeting_room_id)
    references meeting_room (id);

alter table meeting_room_bookmark
    add constraint FK_meeting_room_bookmark_meeting_room
    foreign key (meeting_room_id)
    references meeting_room (id);

alter table meeting_room_bookmark
    add constraint FK_meeting_room_bookmark_member
    foreign key (member_id)
    references member (id);

alter table meeting_room_equipment
    add constraint FK_meeting_room_equipment_meeting_room
    foreign key (meeting_room_id)
    references meeting_room (id);

alter table meeting_room_image
    add constraint FK_meeting_room_image_meeting_room
    foreign key (meeting_room_id)
    references meeting_room (id);

alter table member
    add constraint FK_member_team
    foreign key (team_id)
    references team (id);

alter table member_meeting
    add constraint FK_member_meeting_meeting
    foreign key (meeting_id)
    references meeting (id);

alter table member_meeting
    add constraint FK_member_meeting_member
    foreign key (member_id)
    references member (id);
