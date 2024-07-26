import { createSlice, PayloadAction } from '@reduxjs/toolkit'
import { AuthState, User } from '../../types/user';


const initialState: AuthState = {
  user: null,
  token: null,
  isAuthenticated: false,
}

const authSlice = createSlice({
  name: 'auth',
  initialState,
  reducers: {
    loginUser: (state, action: PayloadAction<{ user: User; token: string }>) => {
      state.user = action.payload.user
      state.token = action.payload.token
      state.isAuthenticated = true
    },
    logoutUser: (state) => {
      state.user = null
      state.token = null
      state.isAuthenticated = false
    },
  },
})

export const { loginUser, logoutUser } = authSlice.actions
export default authSlice.reducer
