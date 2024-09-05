import prisma from "@repo/db/client"
import { clientSignUpSchem } from "@repo/schema/signup"
import bcryt from "bcrypt"

export async function clientSignUp(req, res) {
  try {
    const body = req.body;
    const parsedPayload = clientSignUpSchem.safeParse(body);
    if (!parsedPayload.success)
      return res.status(403).json({ error: parsedPayload.error.errors })

    let user;
    try {
      user = await prisma.client.findUnique({
        where: OR[
          {
            username: body.username
          },
          {
            email: body.email
          }
        ]
      })
    }
    catch (e) {
      console.log("DB might be down\n", e);
      return res.status(500).json({ error: "Internal Server Error" })
    }
    if (user) {
      return res.status(403).json({ error: "Username/email already exists" })
    }

    const hashedPasssword = bcryt.s
    const newUser = await prisma.client.create({
      data: {
        firstName: body.firstName,
        lastName: body.lastName,
        username: body.username,
        password: "",
        isOrganization: body.isOrganization,
        profilePicLink: body.profilePicLink,
        email: body.email
      }
    })
  } catch (e) {
    res.status(500).json({ error: "Internal Server Error" });
  }
}
