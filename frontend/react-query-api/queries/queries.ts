// generated with @7nohe/openapi-react-query-codegen@1.4.1 

import { UseMutationOptions, UseQueryOptions, useMutation, useQuery } from "@tanstack/react-query";
import { GamesService, OrganizationsService, PhasesService, PlayersService, SessionsService, TournamentsService, UsersService } from "../requests/services.gen";
import { Game, Organization, Phase, PlayerRequest, TournamentDetails, UserDetails, UserLoginRequest, UserPostRequest } from "../requests/types.gen";
import * as Common from "./common";
export const useGamesServiceListGames = <TData = Common.GamesServiceListGamesDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>(queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UseGamesServiceListGamesKeyFn(queryKey), queryFn: () => GamesService.listGames() as TData, ...options });
export const useGamesServiceGetGame = <TData = Common.GamesServiceGetGameDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UseGamesServiceGetGameKeyFn({ id }, queryKey), queryFn: () => GamesService.getGame({ id }) as TData, ...options });
export const useOrganizationsServiceListOrganizations = <TData = Common.OrganizationsServiceListOrganizationsDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>(queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UseOrganizationsServiceListOrganizationsKeyFn(queryKey), queryFn: () => OrganizationsService.listOrganizations() as TData, ...options });
export const useOrganizationsServiceGetOrganization = <TData = Common.OrganizationsServiceGetOrganizationDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: string;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UseOrganizationsServiceGetOrganizationKeyFn({ id }, queryKey), queryFn: () => OrganizationsService.getOrganization({ id }) as TData, ...options });
export const useOrganizationsServiceGetOrganizationStaff = <TData = Common.OrganizationsServiceGetOrganizationStaffDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: string;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UseOrganizationsServiceGetOrganizationStaffKeyFn({ id }, queryKey), queryFn: () => OrganizationsService.getOrganizationStaff({ id }) as TData, ...options });
export const usePhasesServiceListTournamentPhases = <TData = Common.PhasesServiceListTournamentPhasesDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ tournamentId }: {
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UsePhasesServiceListTournamentPhasesKeyFn({ tournamentId }, queryKey), queryFn: () => PhasesService.listTournamentPhases({ tournamentId }) as TData, ...options });
export const usePhasesServiceShowTournamentPhase = <TData = Common.PhasesServiceShowTournamentPhaseDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id, tournamentId }: {
  id: number;
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UsePhasesServiceShowTournamentPhaseKeyFn({ id, tournamentId }, queryKey), queryFn: () => PhasesService.showTournamentPhase({ id, tournamentId }) as TData, ...options });
export const usePlayersServiceListPlayers = <TData = Common.PlayersServiceListPlayersDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ tournamentId }: {
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UsePlayersServiceListPlayersKeyFn({ tournamentId }, queryKey), queryFn: () => PlayersService.listPlayers({ tournamentId }) as TData, ...options });
export const usePlayersServiceShowTournamentPlayer = <TData = Common.PlayersServiceShowTournamentPlayerDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id, tournamentId }: {
  id: number;
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UsePlayersServiceShowTournamentPlayerKeyFn({ id, tournamentId }, queryKey), queryFn: () => PlayersService.showTournamentPlayer({ id, tournamentId }) as TData, ...options });
export const useTournamentsServiceListTournaments = <TData = Common.TournamentsServiceListTournamentsDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ organizationId }: {
  organizationId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UseTournamentsServiceListTournamentsKeyFn({ organizationId }, queryKey), queryFn: () => TournamentsService.listTournaments({ organizationId }) as TData, ...options });
export const useTournamentsServiceGetTournament = <TData = Common.TournamentsServiceGetTournamentDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id, organizationId }: {
  id: number;
  organizationId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UseTournamentsServiceGetTournamentKeyFn({ id, organizationId }, queryKey), queryFn: () => TournamentsService.getTournament({ id, organizationId }) as TData, ...options });
export const useUsersServiceListUsers = <TData = Common.UsersServiceListUsersDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>(queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UseUsersServiceListUsersKeyFn(queryKey), queryFn: () => UsersService.listUsers() as TData, ...options });
export const useUsersServiceGetUser = <TData = Common.UsersServiceGetUserDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useQuery<TData, TError>({ queryKey: Common.UseUsersServiceGetUserKeyFn({ id }, queryKey), queryFn: () => UsersService.getUser({ id }) as TData, ...options });
export const useGamesServicePostGame = <TData = Common.GamesServicePostGameMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  requestBody?: Game;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  requestBody?: Game;
}, TContext>({ mutationFn: ({ requestBody }) => GamesService.postGame({ requestBody }) as unknown as Promise<TData>, ...options });
export const useOrganizationsServicePostOrganization = <TData = Common.OrganizationsServicePostOrganizationMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  requestBody?: Organization;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  requestBody?: Organization;
}, TContext>({ mutationFn: ({ requestBody }) => OrganizationsService.postOrganization({ requestBody }) as unknown as Promise<TData>, ...options });
export const usePhasesServicePostTournamentPhase = <TData = Common.PhasesServicePostTournamentPhaseMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  requestBody?: Phase;
  tournamentId: number;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  requestBody?: Phase;
  tournamentId: number;
}, TContext>({ mutationFn: ({ requestBody, tournamentId }) => PhasesService.postTournamentPhase({ requestBody, tournamentId }) as unknown as Promise<TData>, ...options });
export const usePlayersServicePostTournamentPlayer = <TData = Common.PlayersServicePostTournamentPlayerMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  requestBody?: PlayerRequest;
  tournamentId: number;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  requestBody?: PlayerRequest;
  tournamentId: number;
}, TContext>({ mutationFn: ({ requestBody, tournamentId }) => PlayersService.postTournamentPlayer({ requestBody, tournamentId }) as unknown as Promise<TData>, ...options });
export const useTournamentsServicePostTournament = <TData = Common.TournamentsServicePostTournamentMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  organizationId: number;
  requestBody?: TournamentDetails;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  organizationId: number;
  requestBody?: TournamentDetails;
}, TContext>({ mutationFn: ({ organizationId, requestBody }) => TournamentsService.postTournament({ organizationId, requestBody }) as unknown as Promise<TData>, ...options });
export const useUsersServicePostUser = <TData = Common.UsersServicePostUserMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  requestBody?: UserPostRequest;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  requestBody?: UserPostRequest;
}, TContext>({ mutationFn: ({ requestBody }) => UsersService.postUser({ requestBody }) as unknown as Promise<TData>, ...options });
export const useSessionsServiceLoginUser = <TData = Common.SessionsServiceLoginUserMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  requestBody?: UserLoginRequest;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  requestBody?: UserLoginRequest;
}, TContext>({ mutationFn: ({ requestBody }) => SessionsService.loginUser({ requestBody }) as unknown as Promise<TData>, ...options });
export const usePhasesServicePutTournamentPhase = <TData = Common.PhasesServicePutTournamentPhaseMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
  requestBody?: Phase;
  tournamentId: number;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
  requestBody?: Phase;
  tournamentId: number;
}, TContext>({ mutationFn: ({ id, requestBody, tournamentId }) => PhasesService.putTournamentPhase({ id, requestBody, tournamentId }) as unknown as Promise<TData>, ...options });
export const useTournamentsServicePutTournament = <TData = Common.TournamentsServicePutTournamentMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
  organizationId: number;
  requestBody?: TournamentDetails;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
  organizationId: number;
  requestBody?: TournamentDetails;
}, TContext>({ mutationFn: ({ id, organizationId, requestBody }) => TournamentsService.putTournament({ id, organizationId, requestBody }) as unknown as Promise<TData>, ...options });
export const useGamesServicePatchGame = <TData = Common.GamesServicePatchGameMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
  requestBody?: Game;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
  requestBody?: Game;
}, TContext>({ mutationFn: ({ id, requestBody }) => GamesService.patchGame({ id, requestBody }) as unknown as Promise<TData>, ...options });
export const useOrganizationsServicePatchOrganization = <TData = Common.OrganizationsServicePatchOrganizationMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: string;
  requestBody?: Organization;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: string;
  requestBody?: Organization;
}, TContext>({ mutationFn: ({ id, requestBody }) => OrganizationsService.patchOrganization({ id, requestBody }) as unknown as Promise<TData>, ...options });
export const usePlayersServicePutTournamentPlayer = <TData = Common.PlayersServicePutTournamentPlayerMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
  requestBody?: PlayerRequest;
  tournamentId: number;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
  requestBody?: PlayerRequest;
  tournamentId: number;
}, TContext>({ mutationFn: ({ id, requestBody, tournamentId }) => PlayersService.putTournamentPlayer({ id, requestBody, tournamentId }) as unknown as Promise<TData>, ...options });
export const useUsersServicePatchUser = <TData = Common.UsersServicePatchUserMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
  requestBody?: UserDetails;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
  requestBody?: UserDetails;
}, TContext>({ mutationFn: ({ id, requestBody }) => UsersService.patchUser({ id, requestBody }) as unknown as Promise<TData>, ...options });
export const useGamesServiceDeleteGame = <TData = Common.GamesServiceDeleteGameMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
}, TContext>({ mutationFn: ({ id }) => GamesService.deleteGame({ id }) as unknown as Promise<TData>, ...options });
export const useOrganizationsServiceDeleteOrganization = <TData = Common.OrganizationsServiceDeleteOrganizationMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: string;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: string;
}, TContext>({ mutationFn: ({ id }) => OrganizationsService.deleteOrganization({ id }) as unknown as Promise<TData>, ...options });
export const usePhasesServiceDeleteTournamentPhase = <TData = Common.PhasesServiceDeleteTournamentPhaseMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
  tournamentId: number;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
  tournamentId: number;
}, TContext>({ mutationFn: ({ id, tournamentId }) => PhasesService.deleteTournamentPhase({ id, tournamentId }) as unknown as Promise<TData>, ...options });
export const usePlayersServiceDeleteTournamentPlayer = <TData = Common.PlayersServiceDeleteTournamentPlayerMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
  tournamentId: number;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
  tournamentId: number;
}, TContext>({ mutationFn: ({ id, tournamentId }) => PlayersService.deleteTournamentPlayer({ id, tournamentId }) as unknown as Promise<TData>, ...options });
export const useTournamentsServiceDeleteTournament = <TData = Common.TournamentsServiceDeleteTournamentMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
  organizationId: number;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
  organizationId: number;
}, TContext>({ mutationFn: ({ id, organizationId }) => TournamentsService.deleteTournament({ id, organizationId }) as unknown as Promise<TData>, ...options });
export const useUsersServiceDeleteUser = <TData = Common.UsersServiceDeleteUserMutationResult, TError = unknown, TContext = unknown>(options?: Omit<UseMutationOptions<TData, TError, {
  id: number;
}, TContext>, "mutationFn">) => useMutation<TData, TError, {
  id: number;
}, TContext>({ mutationFn: ({ id }) => UsersService.deleteUser({ id }) as unknown as Promise<TData>, ...options });
