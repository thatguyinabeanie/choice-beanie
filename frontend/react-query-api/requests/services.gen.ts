// This file is auto-generated by @hey-api/openapi-ts

import type { CancelablePromise } from "./core/CancelablePromise";
import type { ApiResult } from "./core/ApiResult";
import { OpenAPI } from "./core/OpenAPI";
import { request as __request } from "./core/request";
import type {
  ListGamesResponse,
  PostGameData,
  PostGameResponse,
  GetGameData,
  GetGameResponse,
  PatchGameData,
  PatchGameResponse,
  DeleteGameData,
  DeleteGameResponse,
  ListOrganizationsResponse,
  PostOrganizationData,
  PostOrganizationResponse,
  GetOrganizationData,
  GetOrganizationResponse,
  PatchOrganizationData,
  PatchOrganizationResponse,
  DeleteOrganizationData,
  DeleteOrganizationResponse,
  GetOrganizationStaffData,
  GetOrganizationStaffResponse,
  ListTournamentPhasesData,
  ListTournamentPhasesResponse,
  PostTournamentPhaseData,
  PostTournamentPhaseResponse,
  ShowTournamentPhaseData,
  ShowTournamentPhaseResponse,
  PutTournamentPhaseData,
  PutTournamentPhaseResponse,
  DeleteTournamentPhaseData,
  DeleteTournamentPhaseResponse,
  ListPlayersData,
  ListPlayersResponse,
  PostTournamentPlayerData,
  PostTournamentPlayerResponse,
  ShowTournamentPlayerData,
  ShowTournamentPlayerResponse,
  PutTournamentPlayerData,
  PutTournamentPlayerResponse,
  DeleteTournamentPlayerData,
  DeleteTournamentPlayerResponse,
  ListTournamentsData,
  ListTournamentsResponse,
  PostTournamentData,
  PostTournamentResponse,
  GetTournamentData,
  GetTournamentResponse,
  PutTournamentData,
  PutTournamentResponse,
  DeleteTournamentData,
  DeleteTournamentResponse,
  ListUsersResponse,
  PostUserData,
  PostUserResponse,
  GetUserData,
  GetUserResponse,
  PatchUserData,
  PatchUserResponse,
  DeleteUserData,
  DeleteUserResponse,
  LoginUserData,
  LoginUserResponse,
} from "./types.gen";

export class GamesService {
  /**
   * List Games
   * Retrieves a list of all games
   * @returns Game successful
   * @throws ApiError
   */
  public static listGames(): CancelablePromise<ApiResult<ListGamesResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/games",
    });
  }

  /**
   * Create Game
   * Creates a new game.
   * @param data The data for the request.
   * @param data.requestBody
   * @returns GameDetail created
   * @throws ApiError
   */
  public static postGame(
    data: PostGameData = {},
  ): CancelablePromise<ApiResult<PostGameResponse>> {
    return __request(OpenAPI, {
      method: "POST",
      url: "/api/v1/games",
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        400: "bad request",
      },
    });
  }

  /**
   * Show Game
   * Retrieves a specific game by ID.
   * @param data The data for the request.
   * @param data.id ID of the game
   * @returns GameDetail successful
   * @throws ApiError
   */
  public static getGame(
    data: GetGameData,
  ): CancelablePromise<ApiResult<GetGameResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/games/{id}",
      path: {
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Update Game
   * Updates a game by ID.
   * @param data The data for the request.
   * @param data.id ID of the game
   * @param data.requestBody
   * @returns GameDetail successful
   * @throws ApiError
   */
  public static patchGame(
    data: PatchGameData,
  ): CancelablePromise<ApiResult<PatchGameResponse>> {
    return __request(OpenAPI, {
      method: "PATCH",
      url: "/api/v1/games/{id}",
      path: {
        id: data.id,
      },
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Delete Game
   * Deletes a game by ID.
   * @param data The data for the request.
   * @param data.id ID of the game
   * @returns unknown successful
   * @throws ApiError
   */
  public static deleteGame(
    data: DeleteGameData,
  ): CancelablePromise<ApiResult<DeleteGameResponse>> {
    return __request(OpenAPI, {
      method: "DELETE",
      url: "/api/v1/games/{id}",
      path: {
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }
}

export class OrganizationsService {
  /**
   * List Organizations
   * @returns Organization successful
   * @throws ApiError
   */
  public static listOrganizations(): CancelablePromise<
    ApiResult<ListOrganizationsResponse>
  > {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/organizations",
    });
  }

  /**
   * Create Organization
   * Creates a new organization.
   * @param data The data for the request.
   * @param data.requestBody
   * @returns OrganizationDetails created
   * @throws ApiError
   */
  public static postOrganization(
    data: PostOrganizationData = {},
  ): CancelablePromise<ApiResult<PostOrganizationResponse>> {
    return __request(OpenAPI, {
      method: "POST",
      url: "/api/v1/organizations",
      body: data.requestBody,
      mediaType: "application/json",
    });
  }

  /**
   * Show Organization
   * Retrieves a specific organization.
   * @param data The data for the request.
   * @param data.id
   * @returns OrganizationDetails successful
   * @throws ApiError
   */
  public static getOrganization(
    data: GetOrganizationData,
  ): CancelablePromise<ApiResult<GetOrganizationResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/organizations/{id}",
      path: {
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Update Organization
   * Updates an existing organization.
   * @param data The data for the request.
   * @param data.id
   * @param data.requestBody
   * @returns OrganizationDetails successful
   * @throws ApiError
   */
  public static patchOrganization(
    data: PatchOrganizationData,
  ): CancelablePromise<ApiResult<PatchOrganizationResponse>> {
    return __request(OpenAPI, {
      method: "PATCH",
      url: "/api/v1/organizations/{id}",
      path: {
        id: data.id,
      },
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Delete Organization
   * Deletes an organization.
   * @param data The data for the request.
   * @param data.id
   * @returns unknown Organization deleted
   * @throws ApiError
   */
  public static deleteOrganization(
    data: DeleteOrganizationData,
  ): CancelablePromise<ApiResult<DeleteOrganizationResponse>> {
    return __request(OpenAPI, {
      method: "DELETE",
      url: "/api/v1/organizations/{id}",
      path: {
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * List Organization Staff
   * Retrieves a list of staff members for a specific organization.
   * @param data The data for the request.
   * @param data.id
   * @returns User successful
   * @throws ApiError
   */
  public static getOrganizationStaff(
    data: GetOrganizationStaffData,
  ): CancelablePromise<ApiResult<GetOrganizationStaffResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/organizations/{id}/staff",
      path: {
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }
}

export class PhasesService {
  /**
   * List Tournament Phases
   * Retrieves a list of all Phases
   * @param data The data for the request.
   * @param data.tournamentId ID of the tournament
   * @returns Phase successful
   * @throws ApiError
   */
  public static listTournamentPhases(
    data: ListTournamentPhasesData,
  ): CancelablePromise<ApiResult<ListTournamentPhasesResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/tournaments/{tournament_id}/phases",
      path: {
        tournament_id: data.tournamentId,
      },
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Create Tournament Phase
   * Creates a new Tournament Phase.
   * @param data The data for the request.
   * @param data.tournamentId ID of the tournament
   * @param data.requestBody
   * @returns PhaseDetails created
   * @throws ApiError
   */
  public static postTournamentPhase(
    data: PostTournamentPhaseData,
  ): CancelablePromise<ApiResult<PostTournamentPhaseResponse>> {
    return __request(OpenAPI, {
      method: "POST",
      url: "/api/v1/tournaments/{tournament_id}/phases",
      path: {
        tournament_id: data.tournamentId,
      },
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Show Tournament Phase
   * Retrieves a Tournament Phase
   * @param data The data for the request.
   * @param data.tournamentId ID of the tournament
   * @param data.id ID of the Phase
   * @returns PhaseDetails successful
   * @throws ApiError
   */
  public static showTournamentPhase(
    data: ShowTournamentPhaseData,
  ): CancelablePromise<ApiResult<ShowTournamentPhaseResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/tournaments/{tournament_id}/phases/{id}",
      path: {
        tournament_id: data.tournamentId,
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Update Tournament Phase
   * Updates a Tournament Phase.
   * @param data The data for the request.
   * @param data.tournamentId ID of the tournament
   * @param data.id ID of the Phase
   * @param data.requestBody
   * @returns PhaseDetails successful
   * @throws ApiError
   */
  public static putTournamentPhase(
    data: PutTournamentPhaseData,
  ): CancelablePromise<ApiResult<PutTournamentPhaseResponse>> {
    return __request(OpenAPI, {
      method: "PUT",
      url: "/api/v1/tournaments/{tournament_id}/phases/{id}",
      path: {
        tournament_id: data.tournamentId,
        id: data.id,
      },
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Delete Tournament Phase
   * Deletes a Tournament Phase.
   * @param data The data for the request.
   * @param data.tournamentId ID of the tournament
   * @param data.id ID of the Phase
   * @returns unknown successful
   * @throws ApiError
   */
  public static deleteTournamentPhase(
    data: DeleteTournamentPhaseData,
  ): CancelablePromise<ApiResult<DeleteTournamentPhaseResponse>> {
    return __request(OpenAPI, {
      method: "DELETE",
      url: "/api/v1/tournaments/{tournament_id}/phases/{id}",
      path: {
        tournament_id: data.tournamentId,
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }
}

export class PlayersService {
  /**
   * List Tournament Players
   * Retrieves a list of all Players
   * @param data The data for the request.
   * @param data.tournamentId ID of the Tournament
   * @returns Player successful
   * @throws ApiError
   */
  public static listPlayers(
    data: ListPlayersData,
  ): CancelablePromise<ApiResult<ListPlayersResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/tournaments/{tournament_id}/players",
      path: {
        tournament_id: data.tournamentId,
      },
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Create Tournament Player
   * Creates a new Player.
   * @param data The data for the request.
   * @param data.tournamentId ID of the Tournament
   * @param data.requestBody
   * @returns PlayerDetails created
   * @throws ApiError
   */
  public static postTournamentPlayer(
    data: PostTournamentPlayerData,
  ): CancelablePromise<ApiResult<PostTournamentPlayerResponse>> {
    return __request(OpenAPI, {
      method: "POST",
      url: "/api/v1/tournaments/{tournament_id}/players",
      path: {
        tournament_id: data.tournamentId,
      },
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Show Tournament Player
   * Retrieves a Player
   * @param data The data for the request.
   * @param data.tournamentId ID of the Tournament
   * @param data.id ID of the Player
   * @returns PlayerDetails successful
   * @throws ApiError
   */
  public static showTournamentPlayer(
    data: ShowTournamentPlayerData,
  ): CancelablePromise<ApiResult<ShowTournamentPlayerResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/tournaments/{tournament_id}/players/{id}",
      path: {
        tournament_id: data.tournamentId,
        id: data.id,
      },
    });
  }

  /**
   * Update Tournament Player
   * Updates a Player.
   * @param data The data for the request.
   * @param data.tournamentId ID of the Tournament
   * @param data.id ID of the Player
   * @param data.requestBody
   * @returns PlayerDetails successful
   * @throws ApiError
   */
  public static putTournamentPlayer(
    data: PutTournamentPlayerData,
  ): CancelablePromise<ApiResult<PutTournamentPlayerResponse>> {
    return __request(OpenAPI, {
      method: "PATCH",
      url: "/api/v1/tournaments/{tournament_id}/players/{id}",
      path: {
        tournament_id: data.tournamentId,
        id: data.id,
      },
      body: data.requestBody,
      mediaType: "application/json",
    });
  }

  /**
   * Delete Tournament Player
   * Deletes a Player.
   * @param data The data for the request.
   * @param data.tournamentId ID of the Tournament
   * @param data.id ID of the Player
   * @returns unknown successful
   * @throws ApiError
   */
  public static deleteTournamentPlayer(
    data: DeleteTournamentPlayerData,
  ): CancelablePromise<ApiResult<DeleteTournamentPlayerResponse>> {
    return __request(OpenAPI, {
      method: "DELETE",
      url: "/api/v1/tournaments/{tournament_id}/players/{id}",
      path: {
        tournament_id: data.tournamentId,
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }
}

export class TournamentsService {
  /**
   * List Tournaments
   * Retrieves a list of all Tournaments
   * @param data The data for the request.
   * @param data.organizationId ID of the Organization
   * @returns Tournament successful
   * @throws ApiError
   */
  public static listTournaments(
    data: ListTournamentsData,
  ): CancelablePromise<ApiResult<ListTournamentsResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/organizations/{organization_id}/tournaments",
      path: {
        organization_id: data.organizationId,
      },
    });
  }

  /**
   * Create Tournament
   * Creates a new Tournament.
   * @param data The data for the request.
   * @param data.organizationId ID of the Organization
   * @param data.requestBody
   * @returns TournamentDetails created
   * @throws ApiError
   */
  public static postTournament(
    data: PostTournamentData,
  ): CancelablePromise<ApiResult<PostTournamentResponse>> {
    return __request(OpenAPI, {
      method: "POST",
      url: "/api/v1/organizations/{organization_id}/tournaments",
      path: {
        organization_id: data.organizationId,
      },
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        422: "unprocessable entity",
      },
    });
  }

  /**
   * Show Tournament
   * Retrieves a specific Tournament.
   * @param data The data for the request.
   * @param data.organizationId ID of the Organization
   * @param data.id ID of the Tournament
   * @returns TournamentDetails successful
   * @throws ApiError
   */
  public static getTournament(
    data: GetTournamentData,
  ): CancelablePromise<ApiResult<GetTournamentResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/organizations/{organization_id}/tournaments/{id}",
      path: {
        organization_id: data.organizationId,
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Update Tournament
   * Updates a Tournament.
   * @param data The data for the request.
   * @param data.organizationId ID of the Organization
   * @param data.id ID of the Tournament
   * @param data.requestBody
   * @returns TournamentDetails successful
   * @throws ApiError
   */
  public static putTournament(
    data: PutTournamentData,
  ): CancelablePromise<ApiResult<PutTournamentResponse>> {
    return __request(OpenAPI, {
      method: "PUT",
      url: "/api/v1/organizations/{organization_id}/tournaments/{id}",
      path: {
        organization_id: data.organizationId,
        id: data.id,
      },
      body: data.requestBody,
      mediaType: "application/json",
    });
  }

  /**
   * Delete Tournament
   * Deletes a Tournament.
   * @param data The data for the request.
   * @param data.organizationId ID of the Organization
   * @param data.id ID of the Tournament
   * @returns unknown successful
   * @throws ApiError
   */
  public static deleteTournament(
    data: DeleteTournamentData,
  ): CancelablePromise<ApiResult<DeleteTournamentResponse>> {
    return __request(OpenAPI, {
      method: "DELETE",
      url: "/api/v1/organizations/{organization_id}/tournaments/{id}",
      path: {
        organization_id: data.organizationId,
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }
}

export class UsersService {
  /**
   * List Users
   * Retrieves a list of all Users
   * @returns User successful
   * @throws ApiError
   */
  public static listUsers(): CancelablePromise<ApiResult<ListUsersResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/users",
    });
  }

  /**
   * Create User
   * Creates a new User.
   * @param data The data for the request.
   * @param data.requestBody
   * @returns UserDetails created
   * @throws ApiError
   */
  public static postUser(
    data: PostUserData = {},
  ): CancelablePromise<ApiResult<PostUserResponse>> {
    return __request(OpenAPI, {
      method: "POST",
      url: "/api/v1/users",
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        422: "unprocessable entity",
      },
    });
  }

  /**
   * Show User
   * Retrieves a specific User by ID.
   * @param data The data for the request.
   * @param data.id ID of the User
   * @returns UserDetails successful
   * @throws ApiError
   */
  public static getUser(
    data: GetUserData,
  ): CancelablePromise<ApiResult<GetUserResponse>> {
    return __request(OpenAPI, {
      method: "GET",
      url: "/api/v1/users/{id}",
      path: {
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Update User
   * Updates an existing User.
   * @param data The data for the request.
   * @param data.id ID of the User
   * @param data.requestBody
   * @returns UserDetails successful
   * @throws ApiError
   */
  public static patchUser(
    data: PatchUserData,
  ): CancelablePromise<ApiResult<PatchUserResponse>> {
    return __request(OpenAPI, {
      method: "PATCH",
      url: "/api/v1/users/{id}",
      path: {
        id: data.id,
      },
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        404: "not found",
      },
    });
  }

  /**
   * Delete User
   * @param data The data for the request.
   * @param data.id ID of the User
   * @returns unknown successful
   * @throws ApiError
   */
  public static deleteUser(
    data: DeleteUserData,
  ): CancelablePromise<ApiResult<DeleteUserResponse>> {
    return __request(OpenAPI, {
      method: "DELETE",
      url: "/api/v1/users/{id}",
      path: {
        id: data.id,
      },
      errors: {
        404: "not found",
      },
    });
  }
}

export class SessionsService {
  /**
   * Login
   * Logs in a User.
   * @param data The data for the request.
   * @param data.requestBody
   * @returns unknown created
   * @throws ApiError
   */
  public static loginUser(
    data: LoginUserData = {},
  ): CancelablePromise<ApiResult<LoginUserResponse>> {
    return __request(OpenAPI, {
      method: "POST",
      url: "/login",
      body: data.requestBody,
      mediaType: "application/json",
      errors: {
        401: "unauthorized",
      },
    });
  }
}
