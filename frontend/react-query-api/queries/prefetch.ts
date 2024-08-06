// generated with @7nohe/openapi-react-query-codegen@1.4.1 

import { type QueryClient } from "@tanstack/react-query";
import { GamesService, OrganizationsService, PhasesService, PlayersService, TournamentsService, UsersService } from "../requests/services.gen";
import * as Common from "./common";
/**
* List Games
* Retrieves a list of all games
* @returns Game successful
* @throws ApiError
*/
export const prefetchUseGamesServiceListGames = (queryClient: QueryClient) => queryClient.prefetchQuery({ queryKey: Common.UseGamesServiceListGamesKeyFn(), queryFn: () => GamesService.listGames() });
/**
* Show Game
* Retrieves a specific game by ID.
* @param data The data for the request.
* @param data.id ID of the game
* @returns GameDetail successful
* @throws ApiError
*/
export const prefetchUseGamesServiceGetGame = (queryClient: QueryClient, { id }: {
  id: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UseGamesServiceGetGameKeyFn({ id }), queryFn: () => GamesService.getGame({ id }) });
/**
* List Organizations
* @returns Organization successful
* @throws ApiError
*/
export const prefetchUseOrganizationsServiceListOrganizations = (queryClient: QueryClient) => queryClient.prefetchQuery({ queryKey: Common.UseOrganizationsServiceListOrganizationsKeyFn(), queryFn: () => OrganizationsService.listOrganizations() });
/**
* Show Organization
* Retrieves a specific organization.
* @param data The data for the request.
* @param data.id
* @returns OrganizationDetails successful
* @throws ApiError
*/
export const prefetchUseOrganizationsServiceGetOrganization = (queryClient: QueryClient, { id }: {
  id: string;
}) => queryClient.prefetchQuery({ queryKey: Common.UseOrganizationsServiceGetOrganizationKeyFn({ id }), queryFn: () => OrganizationsService.getOrganization({ id }) });
/**
* List Organization Staff
* Retrieves a list of staff members for a specific organization.
* @param data The data for the request.
* @param data.id
* @returns User successful
* @throws ApiError
*/
export const prefetchUseOrganizationsServiceGetOrganizationStaff = (queryClient: QueryClient, { id }: {
  id: string;
}) => queryClient.prefetchQuery({ queryKey: Common.UseOrganizationsServiceGetOrganizationStaffKeyFn({ id }), queryFn: () => OrganizationsService.getOrganizationStaff({ id }) });
/**
* List Tournament Phases
* Retrieves a list of all Phases
* @param data The data for the request.
* @param data.tournamentId ID of the tournament
* @returns Phase successful
* @throws ApiError
*/
export const prefetchUsePhasesServiceListTournamentPhases = (queryClient: QueryClient, { tournamentId }: {
  tournamentId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UsePhasesServiceListTournamentPhasesKeyFn({ tournamentId }), queryFn: () => PhasesService.listTournamentPhases({ tournamentId }) });
/**
* Show Tournament Phase
* Retrieves a Tournament Phase
* @param data The data for the request.
* @param data.tournamentId ID of the tournament
* @param data.id ID of the Phase
* @returns PhaseDetails successful
* @throws ApiError
*/
export const prefetchUsePhasesServiceShowTournamentPhase = (queryClient: QueryClient, { id, tournamentId }: {
  id: number;
  tournamentId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UsePhasesServiceShowTournamentPhaseKeyFn({ id, tournamentId }), queryFn: () => PhasesService.showTournamentPhase({ id, tournamentId }) });
/**
* List Tournament Players
* Retrieves a list of all Players
* @param data The data for the request.
* @param data.tournamentId ID of the Tournament
* @returns Player successful
* @throws ApiError
*/
export const prefetchUsePlayersServiceListPlayers = (queryClient: QueryClient, { tournamentId }: {
  tournamentId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UsePlayersServiceListPlayersKeyFn({ tournamentId }), queryFn: () => PlayersService.listPlayers({ tournamentId }) });
/**
* Show Tournament Player
* Retrieves a Player
* @param data The data for the request.
* @param data.tournamentId ID of the Tournament
* @param data.id ID of the Player
* @returns PlayerDetails successful
* @throws ApiError
*/
export const prefetchUsePlayersServiceShowTournamentPlayer = (queryClient: QueryClient, { id, tournamentId }: {
  id: number;
  tournamentId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UsePlayersServiceShowTournamentPlayerKeyFn({ id, tournamentId }), queryFn: () => PlayersService.showTournamentPlayer({ id, tournamentId }) });
/**
* List Tournaments
* Retrieves a list of all Tournaments
* @param data The data for the request.
* @param data.organizationId ID of the Organization
* @returns Tournament successful
* @throws ApiError
*/
export const prefetchUseTournamentsServiceListTournaments = (queryClient: QueryClient, { organizationId }: {
  organizationId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UseTournamentsServiceListTournamentsKeyFn({ organizationId }), queryFn: () => TournamentsService.listTournaments({ organizationId }) });
/**
* Show Tournament
* Retrieves a specific Tournament.
* @param data The data for the request.
* @param data.organizationId ID of the Organization
* @param data.id ID of the Tournament
* @returns TournamentDetails successful
* @throws ApiError
*/
export const prefetchUseTournamentsServiceGetTournament = (queryClient: QueryClient, { id, organizationId }: {
  id: number;
  organizationId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UseTournamentsServiceGetTournamentKeyFn({ id, organizationId }), queryFn: () => TournamentsService.getTournament({ id, organizationId }) });
/**
* List Users
* Retrieves a list of all Users
* @returns User successful
* @throws ApiError
*/
export const prefetchUseUsersServiceListUsers = (queryClient: QueryClient) => queryClient.prefetchQuery({ queryKey: Common.UseUsersServiceListUsersKeyFn(), queryFn: () => UsersService.listUsers() });
/**
* Show User
* Retrieves a specific User by ID.
* @param data The data for the request.
* @param data.id ID of the User
* @returns UserDetails successful
* @throws ApiError
*/
export const prefetchUseUsersServiceGetUser = (queryClient: QueryClient, { id }: {
  id: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UseUsersServiceGetUserKeyFn({ id }), queryFn: () => UsersService.getUser({ id }) });
