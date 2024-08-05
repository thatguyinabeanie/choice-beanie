// generated with @7nohe/openapi-react-query-codegen@1.4.1 

import { UseQueryResult } from "@tanstack/react-query";
import { GamesService, OrganizationsService, PhasesService, PlayersService, SessionsService, TournamentsService, UsersService } from "../requests/services.gen";
export type GamesServiceListGamesDefaultResponse = Awaited<ReturnType<typeof GamesService.listGames>>;
export type GamesServiceListGamesQueryResult<TData = GamesServiceListGamesDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const useGamesServiceListGamesKey = "GamesServiceListGames";
export const UseGamesServiceListGamesKeyFn = (queryKey?: Array<unknown>) => [useGamesServiceListGamesKey, ...(queryKey ?? [])];
export type GamesServiceGetGameDefaultResponse = Awaited<ReturnType<typeof GamesService.getGame>>;
export type GamesServiceGetGameQueryResult<TData = GamesServiceGetGameDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const useGamesServiceGetGameKey = "GamesServiceGetGame";
export const UseGamesServiceGetGameKeyFn = ({ id }: {
  id: number;
}, queryKey?: Array<unknown>) => [useGamesServiceGetGameKey, ...(queryKey ?? [{ id }])];
export type OrganizationsServiceListOrganizationsDefaultResponse = Awaited<ReturnType<typeof OrganizationsService.listOrganizations>>;
export type OrganizationsServiceListOrganizationsQueryResult<TData = OrganizationsServiceListOrganizationsDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const useOrganizationsServiceListOrganizationsKey = "OrganizationsServiceListOrganizations";
export const UseOrganizationsServiceListOrganizationsKeyFn = (queryKey?: Array<unknown>) => [useOrganizationsServiceListOrganizationsKey, ...(queryKey ?? [])];
export type OrganizationsServiceGetOrganizationDefaultResponse = Awaited<ReturnType<typeof OrganizationsService.getOrganization>>;
export type OrganizationsServiceGetOrganizationQueryResult<TData = OrganizationsServiceGetOrganizationDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const useOrganizationsServiceGetOrganizationKey = "OrganizationsServiceGetOrganization";
export const UseOrganizationsServiceGetOrganizationKeyFn = ({ id }: {
  id: string;
}, queryKey?: Array<unknown>) => [useOrganizationsServiceGetOrganizationKey, ...(queryKey ?? [{ id }])];
export type OrganizationsServiceGetOrganizationStaffDefaultResponse = Awaited<ReturnType<typeof OrganizationsService.getOrganizationStaff>>;
export type OrganizationsServiceGetOrganizationStaffQueryResult<TData = OrganizationsServiceGetOrganizationStaffDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const useOrganizationsServiceGetOrganizationStaffKey = "OrganizationsServiceGetOrganizationStaff";
export const UseOrganizationsServiceGetOrganizationStaffKeyFn = ({ id }: {
  id: string;
}, queryKey?: Array<unknown>) => [useOrganizationsServiceGetOrganizationStaffKey, ...(queryKey ?? [{ id }])];
export type PhasesServiceListTournamentPhasesDefaultResponse = Awaited<ReturnType<typeof PhasesService.listTournamentPhases>>;
export type PhasesServiceListTournamentPhasesQueryResult<TData = PhasesServiceListTournamentPhasesDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const usePhasesServiceListTournamentPhasesKey = "PhasesServiceListTournamentPhases";
export const UsePhasesServiceListTournamentPhasesKeyFn = ({ tournamentId }: {
  tournamentId: number;
}, queryKey?: Array<unknown>) => [usePhasesServiceListTournamentPhasesKey, ...(queryKey ?? [{ tournamentId }])];
export type PhasesServiceShowTournamentPhaseDefaultResponse = Awaited<ReturnType<typeof PhasesService.showTournamentPhase>>;
export type PhasesServiceShowTournamentPhaseQueryResult<TData = PhasesServiceShowTournamentPhaseDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const usePhasesServiceShowTournamentPhaseKey = "PhasesServiceShowTournamentPhase";
export const UsePhasesServiceShowTournamentPhaseKeyFn = ({ id, tournamentId }: {
  id: number;
  tournamentId: number;
}, queryKey?: Array<unknown>) => [usePhasesServiceShowTournamentPhaseKey, ...(queryKey ?? [{ id, tournamentId }])];
export type PlayersServiceListPlayersDefaultResponse = Awaited<ReturnType<typeof PlayersService.listPlayers>>;
export type PlayersServiceListPlayersQueryResult<TData = PlayersServiceListPlayersDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const usePlayersServiceListPlayersKey = "PlayersServiceListPlayers";
export const UsePlayersServiceListPlayersKeyFn = ({ tournamentId }: {
  tournamentId: number;
}, queryKey?: Array<unknown>) => [usePlayersServiceListPlayersKey, ...(queryKey ?? [{ tournamentId }])];
export type PlayersServiceShowTournamentPlayerDefaultResponse = Awaited<ReturnType<typeof PlayersService.showTournamentPlayer>>;
export type PlayersServiceShowTournamentPlayerQueryResult<TData = PlayersServiceShowTournamentPlayerDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const usePlayersServiceShowTournamentPlayerKey = "PlayersServiceShowTournamentPlayer";
export const UsePlayersServiceShowTournamentPlayerKeyFn = ({ id, tournamentId }: {
  id: number;
  tournamentId: number;
}, queryKey?: Array<unknown>) => [usePlayersServiceShowTournamentPlayerKey, ...(queryKey ?? [{ id, tournamentId }])];
export type TournamentsServiceListTournamentsDefaultResponse = Awaited<ReturnType<typeof TournamentsService.listTournaments>>;
export type TournamentsServiceListTournamentsQueryResult<TData = TournamentsServiceListTournamentsDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const useTournamentsServiceListTournamentsKey = "TournamentsServiceListTournaments";
export const UseTournamentsServiceListTournamentsKeyFn = ({ organizationId }: {
  organizationId: number;
}, queryKey?: Array<unknown>) => [useTournamentsServiceListTournamentsKey, ...(queryKey ?? [{ organizationId }])];
export type TournamentsServiceGetTournamentDefaultResponse = Awaited<ReturnType<typeof TournamentsService.getTournament>>;
export type TournamentsServiceGetTournamentQueryResult<TData = TournamentsServiceGetTournamentDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const useTournamentsServiceGetTournamentKey = "TournamentsServiceGetTournament";
export const UseTournamentsServiceGetTournamentKeyFn = ({ id, organizationId }: {
  id: number;
  organizationId: number;
}, queryKey?: Array<unknown>) => [useTournamentsServiceGetTournamentKey, ...(queryKey ?? [{ id, organizationId }])];
export type UsersServiceListUsersDefaultResponse = Awaited<ReturnType<typeof UsersService.listUsers>>;
export type UsersServiceListUsersQueryResult<TData = UsersServiceListUsersDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const useUsersServiceListUsersKey = "UsersServiceListUsers";
export const UseUsersServiceListUsersKeyFn = (queryKey?: Array<unknown>) => [useUsersServiceListUsersKey, ...(queryKey ?? [])];
export type UsersServiceGetUserDefaultResponse = Awaited<ReturnType<typeof UsersService.getUser>>;
export type UsersServiceGetUserQueryResult<TData = UsersServiceGetUserDefaultResponse, TError = unknown> = UseQueryResult<TData, TError>;
export const useUsersServiceGetUserKey = "UsersServiceGetUser";
export const UseUsersServiceGetUserKeyFn = ({ id }: {
  id: number;
}, queryKey?: Array<unknown>) => [useUsersServiceGetUserKey, ...(queryKey ?? [{ id }])];
export type GamesServicePostGameMutationResult = Awaited<ReturnType<typeof GamesService.postGame>>;
export type OrganizationsServicePostOrganizationMutationResult = Awaited<ReturnType<typeof OrganizationsService.postOrganization>>;
export type PhasesServicePostTournamentPhaseMutationResult = Awaited<ReturnType<typeof PhasesService.postTournamentPhase>>;
export type PlayersServicePostTournamentPlayerMutationResult = Awaited<ReturnType<typeof PlayersService.postTournamentPlayer>>;
export type TournamentsServicePostTournamentMutationResult = Awaited<ReturnType<typeof TournamentsService.postTournament>>;
export type UsersServicePostUserMutationResult = Awaited<ReturnType<typeof UsersService.postUser>>;
export type SessionsServiceLoginUserMutationResult = Awaited<ReturnType<typeof SessionsService.loginUser>>;
export type PhasesServicePutTournamentPhaseMutationResult = Awaited<ReturnType<typeof PhasesService.putTournamentPhase>>;
export type TournamentsServicePutTournamentMutationResult = Awaited<ReturnType<typeof TournamentsService.putTournament>>;
export type GamesServicePatchGameMutationResult = Awaited<ReturnType<typeof GamesService.patchGame>>;
export type OrganizationsServicePatchOrganizationMutationResult = Awaited<ReturnType<typeof OrganizationsService.patchOrganization>>;
export type PlayersServicePutTournamentPlayerMutationResult = Awaited<ReturnType<typeof PlayersService.putTournamentPlayer>>;
export type UsersServicePatchUserMutationResult = Awaited<ReturnType<typeof UsersService.patchUser>>;
export type GamesServiceDeleteGameMutationResult = Awaited<ReturnType<typeof GamesService.deleteGame>>;
export type OrganizationsServiceDeleteOrganizationMutationResult = Awaited<ReturnType<typeof OrganizationsService.deleteOrganization>>;
export type PhasesServiceDeleteTournamentPhaseMutationResult = Awaited<ReturnType<typeof PhasesService.deleteTournamentPhase>>;
export type PlayersServiceDeleteTournamentPlayerMutationResult = Awaited<ReturnType<typeof PlayersService.deleteTournamentPlayer>>;
export type TournamentsServiceDeleteTournamentMutationResult = Awaited<ReturnType<typeof TournamentsService.deleteTournament>>;
export type UsersServiceDeleteUserMutationResult = Awaited<ReturnType<typeof UsersService.deleteUser>>;
