/**
 * TASK: Main Routing & Auth Provider Setup
 */
import { BrowserRouter, Routes, Route } from "react-router-dom";
import HomeScreen from "./screens/HomeScreen.jsx";
import ProviderListScreen from "./screens/ProviderListScreen.jsx";
import BookingScreen from "./screens/BookingScreen.jsx";
import TrackingScreen from "./screens/TrackingScreen.jsx";
import LoginScreen from "./screens/LoginScreen.jsx";

export default function App() {
  // HALF COMPLETED LOGIC: Auth Check
  // const [user, setUser] = useState(null);
  // useEffect(() => { check token in localStorage... })

  return (
    <BrowserRouter>
      {/* TODO: Wrap with AuthContext.Provider */}
      <Routes>
        <Route path="/login" element={<LoginScreen />} />
        <Route path="/" element={<HomeScreen />} />
        <Route path="/providers" element={<ProviderListScreen />} />
        <Route path="/book/:providerId" element={<BookingScreen />} />
        <Route path="/track/:bookingId" element={<TrackingScreen />} />
      </Routes>
    </BrowserRouter>
  );
}
