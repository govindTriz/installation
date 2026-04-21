-- SQL Script to create histories and users tables
-- Run this against your fms_history_db database

-- Enable the uuid-ossp extension if not already enabled (required for UUID generation)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create 'users' table
CREATE TABLE IF NOT EXISTS "users" (
  "id" uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  "name" varchar(100) NOT NULL,
  "email" varchar(150) UNIQUE NOT NULL,
  "phone" varchar(20),
  "isActive" boolean NOT NULL DEFAULT true,
  "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
  "updatedAt" TIMESTAMP NOT NULL DEFAULT now()
);

-- Create 'histories' table
CREATE TABLE IF NOT EXISTS "histories" (
  "id" uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  "customer_id" varchar(150),
  "section_name" varchar(100) NOT NULL,
  "section_id" varchar(150) NOT NULL,
  "action" varchar(50) NOT NULL,
  "created_by_user_name" varchar(100),
  "created_by_user_id" varchar(100),
  "updated_by_user_name" varchar(100),
  "updated_by_user_id" varchar(100),
  "old_data" jsonb,
  "new_data" jsonb,
  "description" text,
  "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
  "updatedAt" TIMESTAMP NOT NULL DEFAULT now()
);
