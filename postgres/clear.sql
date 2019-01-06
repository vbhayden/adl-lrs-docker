/* 
Script to clear out the ADL LRS

This script will remove all entries of xAPI data, leaving the Agents intact.
Those can be removed with another script.
*/
DELETE FROM lrs_verb;
DELETE FROM lrs_activity;
DELETE FROM lrs_substatement;
DELETE FROM lrs_statement;
DELETE FROM lrs_statementattachment;
DELETE FROM lrs_activitystate;
DELETE FROM lrs_activityprofile;

DELETE FROM oauth_provider_nonce;
DELETE FROM oauth_provider_consumer;
DELETE FROM oauth_provider_token;

DELETE FROM adl_lrs_hook;
