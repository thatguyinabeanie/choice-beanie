import { useState } from "react";
import { useRouter } from "next/navigation";

import { UsersApi } from "@/api-client/api"; // Adjust the import based on your OpenAPI client setup

const Login = () => {
  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });

  const router = useRouter();

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      const userApi = new UsersApi();

      await userApi.loginUser({
        email: formData.email,
        password: formData.password,
      });

      router.push("/dashboard");
    } catch (error) {
      console.error("Error logging in:", error);
    }
  };

  return (
    <form onSubmit={ handleSubmit }>
      <input
        name="email"
        placeholder="Email"
        type="email"
        onChange={ handleChange }
      />
      <input
        name="password"
        placeholder="Password"
        type="password"
        onChange={ handleChange }
      />
      <button type="submit">Login</button>
    </form>
  );
};

export default Login;
