CREATE TABLE public."Groups" (
    id bigint NOT NULL,
    "userId" bigint,
    "groupName" character varying(255)
);

CREATE TABLE public."GroupMembers" (
    id integer NOT NULL,
    "groupId" bigint,
    "userId" bigint,
    "roleId" integer,
    fullname character varying,
    "famePoint" integer DEFAULT 0 NOT NULL
);
