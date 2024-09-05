import { z } from "zod";

export const clientSignUpSchema = z.object({
  firstName: z.string(),
  lastName: z.string(),
  username: z.string(),
  password: z.string(),
  isOrganization: z.boolean().optional(),
  profilePicLink: z.string().optional(),
  email: z.string().email()
})

export const lancerSignUpSchema = z.object({
  firstName: z.string(),
  lastName: z.string(),
  username: z.string(),
  password: z.string(),
  profilePicLink: z.string().optional(),
  workLink: z.string().optional(),
  aboutMe: z.string(),
  isOrganization: z.boolean().optional(),
  email: z.string().email()
})

export const modSignUpSchema = z.object({
  firstName: z.string(),
  lastName: z.string(),
  username: z.string(),
  password: z.string(),
  profilePicLink: z.string().optional(),
  email: z.string().email()
})
