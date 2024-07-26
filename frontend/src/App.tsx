import { Route, Routes } from 'react-router-dom'
import GamesTable from './components/GamesTable'
// import DiscordLoginButton from './components/DiscordLoginButton'
// import AuthCallback from './components/AuthCallback'
// import TournamentDashboard from './pages/TournamentDashboard'
// import ProtectedRoute from './components/ProtectedRoute'

function App () {
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={ <p>Hello World</p> } />
        <Route path="/games" element={ <GamesTable /> } />
      </Routes>
    </div>
  )
}

export default App
