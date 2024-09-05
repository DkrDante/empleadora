import { Router } from "express";

export const userRouter = Router();

//create user
userRouter.post("/signup/client",)
userRouter.post("/signup/lancer",)
userRouter.post("/signup/mod",)

//loign User
userRouter.post("/login/client",)
userRouter.post("/login/lancer",)
userRouter.post("/login/mod",)

//deactivate;
userRouter.post("/deactivate/client",)
userRouter.post("/deactivate/lancer",)
userRouter.post("/deactivate/mod",)

//edit
userRouter.put("/edit/client",)
userRouter.put("/edit/lancer",)
userRouter.put("/edit/mod",)


