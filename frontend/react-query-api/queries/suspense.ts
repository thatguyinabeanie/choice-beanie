// generated with @7nohe/openapi-react-query-codegen@1.4.1 

import { UseQueryOptions, useSuspenseQuery } from "@tanstack/react-query";
import { GamesService, OrganizationsService, PhasesService, PlayersService, TournamentsService, UsersService } from "../requests/services.gen";
import * as Common from "./common";
export const useGamesServiceListGamesSuspense = <TData = Common.GamesServiceListGamesDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>(queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseGamesServiceListGamesKeyFn(queryKey), queryFn: () => GamesService.listGames() as TData, ...options });
export const useGamesServiceGetGameSuspense = <TData = Common.GamesServiceGetGameDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseGamesServiceGetGameKeyFn({ id }, queryKey), queryFn: () => GamesService.getGame({ id }) as TData, ...options });
export const useOrganizationsServiceListOrganizationsSuspense = <TData = Common.OrganizationsServiceListOrganizationsDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>(queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseOrganizationsServiceListOrganizationsKeyFn(queryKey), queryFn: () => OrganizationsService.listOrganizations() as TData, ...options });
export const useOrganizationsServiceGetOrganizationSuspense = <TData = Common.OrganizationsServiceGetOrganizationDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: string;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseOrganizationsServiceGetOrganizationKeyFn({ id }, queryKey), queryFn: () => OrganizationsService.getOrganization({ id }) as TData, ...options });
export const useOrganizationsServiceGetOrganizationStaffSuspense = <TData = Common.OrganizationsServiceGetOrganizationStaffDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: string;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseOrganizationsServiceGetOrganizationStaffKeyFn({ id }, queryKey), queryFn: () => OrganizationsService.getOrganizationStaff({ id }) as TData, ...options });
export const usePhasesServiceListTournamentPhasesSuspense = <TData = Common.PhasesServiceListTournamentPhasesDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ tournamentId }: {
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UsePhasesServiceListTournamentPhasesKeyFn({ tournamentId }, queryKey), queryFn: () => PhasesService.listTournamentPhases({ tournamentId }) as TData, ...options });
export const usePhasesServiceShowTournamentPhaseSuspense = <TData = Common.PhasesServiceShowTournamentPhaseDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id, tournamentId }: {
  id: number;
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UsePhasesServiceShowTournamentPhaseKeyFn({ id, tournamentId }, queryKey), queryFn: () => PhasesService.showTournamentPhase({ id, tournamentId }) as TData, ...options });
export const usePlayersServiceListPlayersSuspense = <TData = Common.PlayersServiceListPlayersDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ tournamentId }: {
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UsePlayersServiceListPlayersKeyFn({ tournamentId }, queryKey), queryFn: () => PlayersService.listPlayers({ tournamentId }) as TData, ...options });
export const usePlayersServiceShowTournamentPlayerSuspense = <TData = Common.PlayersServiceShowTournamentPlayerDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id, tournamentId }: {
  id: number;
  tournamentId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UsePlayersServiceShowTournamentPlayerKeyFn({ id, tournamentId }, queryKey), queryFn: () => PlayersService.showTournamentPlayer({ id, tournamentId }) as TData, ...options });
export const useTournamentsServiceListTournamentsSuspense = <TData = Common.TournamentsServiceListTournamentsDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ organizationId }: {
  organizationId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseTournamentsServiceListTournamentsKeyFn({ organizationId }, queryKey), queryFn: () => TournamentsService.listTournaments({ organizationId }) as TData, ...options });
export const useTournamentsServiceGetTournamentSuspense = <TData = Common.TournamentsServiceGetTournamentDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id, organizationId }: {
  id: number;
  organizationId: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseTournamentsServiceGetTournamentKeyFn({ id, organizationId }, queryKey), queryFn: () => TournamentsService.getTournament({ id, organizationId }) as TData, ...options });
export const useUsersServiceListUsersSuspense = <TData = Common.UsersServiceListUsersDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>(queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseUsersServiceListUsersKeyFn(queryKey), queryFn: () => UsersService.listUsers() as TData, ...options });
export const useUsersServiceGetUserSuspense = <TData = Common.UsersServiceGetUserDefaultResponse, TError = unknown, TQueryKey extends Array<unknown> = unknown[]>({ id }: {
  id: number;
}, queryKey?: TQueryKey, options?: Omit<UseQueryOptions<TData, TError>, "queryKey" | "queryFn">) => useSuspenseQuery<TData, TError>({ queryKey: Common.UseUsersServiceGetUserKeyFn({ id }, queryKey), queryFn: () => UsersService.getUser({ id }) as TData, ...options });
