CREATE TABLE "public"."request" ("id" serial,"user_id" int4,"space_id" int4, PRIMARY KEY ("id"), "approved" bool DEFAULT NULL, "from_date" date, "to_date" date);
