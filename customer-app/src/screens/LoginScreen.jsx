/**
 * TASK: OTP Login UI
 */
import React, { useState } from "react";
import axios from "axios";

export default function LoginScreen() {
  const [phone, setPhone] = useState("");
  const [otp, setOtp] = useState("");
  const [step, setStep] = useState(1); // 1 = Phone, 2 = OTP

  const sendOtp = async () => {
    // await axios.post("/api/v1/auth/send-otp", { phone });
    setStep(2);
  };

  const verifyOtp = async () => {
    // const res = await axios.post("/api/v1/auth/verify-otp", { phone, otp });
    // localStorage.setItem("token", res.data.token);
    // window.location.href = "/";
  };

  return (
    <div>
      <h1>Login</h1>
      {step === 1 ? (
        <><input value={phone} onChange={e => setPhone(e.target.value)} /><button onClick={sendOtp}>Send OTP</button></>
      ) : (
        <><input value={otp} onChange={e => setOtp(e.target.value)} /><button onClick={verifyOtp}>Verify</button></>
      )}
    </div>
  );
}
