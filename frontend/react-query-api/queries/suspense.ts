// generated with @7nohe/openapi-react-query-codegen@1.4.1 

import { UseQueryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { GamesService, OrganizationsService, PhasesService, PlayersService, TournamentsService, UsersService } from "../requests/services.gen";
import * as Common from "./common";
/**
* List Games
* Retrieves a list of all games
* @returns Game successful
* @throws ApiError
*/
export const useGamesServiceListGamesSuspense = <TData = Common.GamesServiceListGamesDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>(queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseGamesServiceListGamesKeyFn(queryKey), queryFn: () => GamesService.listGames() as TData, ...options });
/**
* Show Game
* Retrieves a specific game by ID.
* @param data The data for the request.
* @param data.id ID of the game
* @returns GameDetail successful
* @throws ApiError
*/
export const useGamesServiceGetGameSuspense = <TData = Common.GamesServiceGetGameDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseGamesServiceGetGameKeyFn({ id }, queryKey), queryFn: () => GamesService.getGame({ id }) as TData, ...options });
/**
* List Organizations
* @returns Organization successful
* @throws ApiError
*/
export const useOrganizationsServiceListOrganizationsSuspense = <TData = Common.OrganizationsServiceListOrganizationsDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>(queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseOrganizationsServiceListOrganizationsKeyFn(queryKey), queryFn: () => OrganizationsService.listOrganizations() as TData, ...options });
/**
* Show Organization
* Retrieves a specific organization.
* @param data The data for the request.
* @param data.id
* @returns OrganizationDetails successful
* @throws ApiError
*/
export const useOrganizationsServiceGetOrganizationSuspense = <TData = Common.OrganizationsServiceGetOrganizationDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: string;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseOrganizationsServiceGetOrganizationKeyFn({ id }, queryKey), queryFn: () => OrganizationsService.getOrganization({ id }) as TData, ...options });
/**
* List Organization Staff
* Retrieves a list of staff members for a specific organization.
* @param data The data for the request.
* @param data.id
* @returns User successful
* @throws ApiError
*/
export const useOrganizationsServiceGetOrganizationStaffSuspense = <TData = Common.OrganizationsServiceGetOrganizationStaffDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: string;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseOrganizationsServiceGetOrganizationStaffKeyFn({ id }, queryKey), queryFn: () => OrganizationsService.getOrganizationStaff({ id }) as TData, ...options });
/**
* List Tournament Phases
* Retrieves a list of all Phases
* @param data The data for the request.
* @param data.tournamentId ID of the tournament
* @returns Phase successful
* @throws ApiError
*/
export const usePhasesServiceListTournamentPhasesSuspense = <TData = Common.PhasesServiceListTournamentPhasesDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ tournamentId }: {
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UsePhasesServiceListTournamentPhasesKeyFn({ tournamentId }, queryKey), queryFn: () => PhasesService.listTournamentPhases({ tournamentId }) as TData, ...options });
/**
* Show Tournament Phase
* Retrieves a Tournament Phase
* @param data The data for the request.
* @param data.tournamentId ID of the tournament
* @param data.id ID of the Phase
* @returns PhaseDetails successful
* @throws ApiError
*/
export const usePhasesServiceShowTournamentPhaseSuspense = <TData = Common.PhasesServiceShowTournamentPhaseDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id, tournamentId }: {
  id: number;
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UsePhasesServiceShowTournamentPhaseKeyFn({ id, tournamentId }, queryKey), queryFn: () => PhasesService.showTournamentPhase({ id, tournamentId }) as TData, ...options });
/**
* List Tournament Players
* Retrieves a list of all Players
* @param data The data for the request.
* @param data.tournamentId ID of the Tournament
* @returns Player successful
* @throws ApiError
*/
export const usePlayersServiceListPlayersSuspense = <TData = Common.PlayersServiceListPlayersDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ tournamentId }: {
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UsePlayersServiceListPlayersKeyFn({ tournamentId }, queryKey), queryFn: () => PlayersService.listPlayers({ tournamentId }) as TData, ...options });
/**
* Show Tournament Player
* Retrieves a Player
* @param data The data for the request.
* @param data.tournamentId ID of the Tournament
* @param data.id ID of the Player
* @returns PlayerDetails successful
* @throws ApiError
*/
export const usePlayersServiceShowTournamentPlayerSuspense = <TData = Common.PlayersServiceShowTournamentPlayerDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id, tournamentId }: {
  id: number;
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UsePlayersServiceShowTournamentPlayerKeyFn({ id, tournamentId }, queryKey), queryFn: () => PlayersService.showTournamentPlayer({ id, tournamentId }) as TData, ...options });
/**
* List Tournaments
* Retrieves a list of all Tournaments
* @param data The data for the request.
* @param data.organizationId ID of the Organization
* @returns Tournament successful
* @throws ApiError
*/
export const useTournamentsServiceListTournamentsSuspense = <TData = Common.TournamentsServiceListTournamentsDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ organizationId }: {
  organizationId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseTournamentsServiceListTournamentsKeyFn({ organizationId }, queryKey), queryFn: () => TournamentsService.listTournaments({ organizationId }) as TData, ...options });
/**
* Show Tournament
* Retrieves a specific Tournament.
* @param data The data for the request.
* @param data.organizationId ID of the Organization
* @param data.id ID of the Tournament
* @returns TournamentDetails successful
* @throws ApiError
*/
export const useTournamentsServiceGetTournamentSuspense = <TData = Common.TournamentsServiceGetTournamentDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id, organizationId }: {
  id: number;
  organizationId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseTournamentsServiceGetTournamentKeyFn({ id, organizationId }, queryKey), queryFn: () => TournamentsService.getTournament({ id, organizationId }) as TData, ...options });
/**
* List Users
* Retrieves a list of all Users
* @returns User successful
* @throws ApiError
*/
export const useUsersServiceListUsersSuspense = <TData = Common.UsersServiceListUsersDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>(queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseUsersServiceListUsersKeyFn(queryKey), queryFn: () => UsersService.listUsers() as TData, ...options });
/**
* Show User
* Retrieves a specific User by ID.
* @param data The data for the request.
* @param data.id ID of the User
* @returns UserDetails successful
* @throws ApiError
*/
export const useUsersServiceGetUserSuspense = <TData = Common.UsersServiceGetUserDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseUsersServiceGetUserKeyFn({ id }, queryKey), queryFn: () => UsersService.getUser({ id }) as TData, ...options });
