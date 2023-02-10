/*
** EPITECH PROJECT, 2023
** test_asm.c
** File description:
** tests_asm
*/

#include <criterion/criterion.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

extern size_t strlen(const char *s);
extern char *strchr(const char *s, int c);
extern char *strrchr(const char *s, int c);
extern void *memset(void *s, int c, size_t n);
extern void *memcpy(void *restrict dest, const void *restrict src, size_t n);
extern int strcmp(const char *s1, const char *s2);
extern void *memmove(void *dest, const void *src, size_t n);
extern int strncmp(const char *s1, const char *s2, size_t n);
extern int strcasecmp(const char *s1, const char *s2);
extern int strcasecmp(const char *s1, const char *s2);
extern char *strstr(const char *haystack, const char *needle);
extern char *strpbrk(const char *s, const char *accept);
extern size_t strcspn(const char *s, const char *accept);

Test(strlen, strlen4)
{
    char *string = "Hola";
    cr_assert_eq(strlen(string), 4);
}

Test(strlen, strlen0)
{
    char *string = "";
    cr_assert_eq(strlen(string), 0);
}

Test(strchr, strchr)
{
    char *s = "Hola";
    char s2 = 'l';
    cr_assert_str_eq(strchr(s, s2), "la");
}

Test(strchr, strchr_empty)
{
    char *s = "";
    char s2 = 'l';
    cr_assert_eq(strchr(s, s2), NULL);
}

Test(strchr, strchr_empty2)
{
    char *s = "";
    char s2 = '\0';
    cr_assert_str_eq(strchr(s, s2), "");
}

Test(strchr, strchr_3)
{
    char *s = "fkozekfokez";
    char s2 = '\0';
    cr_assert_str_eq(strchr(s, s2), "");
}

Test(strchr, strchr_4)
{
    char *s = "fkoekfokez";
    char s2 = 'z';
    cr_assert_str_eq(strchr(s, s2), "z");
}

Test(strchr, strchr_not_in_string)
{
    char *s = "fdddd";
    char s2 = 'z';
    cr_assert_eq(strchr(s, s2), NULL);
}

Test(strchr, strchr_in_string)
{
    char *s = "ddfdddd";
    char s2 = 'd';
    cr_assert_eq(strchr(s, s2), s);
}

Test(strrchr, strrchr_empty)
{
    char *s = "";
    char s2 = 'l';
    cr_assert_eq(strrchr(s, s2), NULL);
}

Test(strrchr, strrchr_empty2)
{
    char *s = "";
    char s2 = '\0';
    cr_assert_str_eq(strrchr(s, s2), "");
}

Test(strrchr, strrchr_3)
{
    char *s = "fkozekfokez";
    char s2 = '\0';
    cr_assert_str_eq(strchr(s, s2), "");
}

Test(strrchr, strrchr_4)
{
    char *s = "fkoekfokez";
    char s2 = 'z';
    cr_assert_str_eq(strrchr(s, s2), "z");
}

Test(strrchr, strrchr_not_in_string)
{
    char *s = "fdddd";
    char s2 = 'z';
    cr_assert_eq(strrchr(s, s2), NULL);
}

Test(strrchr, strrchr_in_string)
{
    char *s = "ddfdddd";
    char s2 = 'd';
    cr_assert_str_eq(strrchr(s, s2), "d");
}

Test(strrchr, strrchr_empty_in_string)
{
    char *s = "";
    char s2 = 'a';
    cr_assert_eq(strrchr(s, s2), NULL);
}

Test(memset, memset)
{
    char s[] = "Bonjour";
    char s2 = 'd';

    memset(s, s2, 5);
    cr_assert_str_eq(s, "dddddur");
}

Test(memset, memset_empty)
{
    char s[] = "f";
    char s2 = 'd';

    memset(s, s2, 1);
    cr_assert_str_eq(s, "d");
}

Test(strcmp, strcmp_not_equal)
{
    char s[] = "f";
    char s2[] = "d";

    cr_assert_eq(strcmp(s, s2), 2);
}

Test(strcmp, strcmp_equal)
{
    char s[] = "f";
    char s2[] = "d";

    cr_assert_eq(strcmp(s, s), 0);
}

Test(strcmp, strcmp_not_equal_string)
{
    char s[] = "ffdfdfd";
    char s2[] = "ffsqdsq";

    cr_assert_eq(strcmp(s, s2), -15);
}

Test(strcmp, strcmp_equal_string_empty)
{
    char s[] = "";
    char s2[] = "";

    cr_assert_eq(strcmp(s, s2), 0);
}

Test(memcpy, memcpy)
{
    char s[] = "Bonjourno Paris";
    char s2[] = "Sheeesh";

    memcpy(s, s2, 7);
    cr_assert_str_eq(s, "Sheeeshno Paris");
}

Test(memcpy, memcpy_empty)
{
    char s[] = "";
    char s2[] = "Sheeesh";

    memcpy(s, s2, 7);
    cr_assert_str_eq(s, "Sheeesh");
}

Test(strncmp, strncmp_not_equal)
{
    char s[] = "f";
    char s2[] = "d";

    cr_assert_eq(strncmp(s, s2, 9), 2);
}

Test(strncmp, strncmp_equal)
{
    char s[] = "f";
    char s2[] = "d";

    cr_assert_eq(strncmp(s, s, 2), 0);
}

Test(strncmp, strncmp_not_equal_string)
{
    char s[] = "ffdfdfd";
    char s2[] = "ffsqdsq";

    cr_assert_eq(strncmp(s, s2, 7), -15);
}

Test(strncmp, strncmp_equal_string_empty)
{
    char s[] = "";
    char s2[] = "";

    cr_assert_eq(strncmp(s, s2, 5), 0);
}

Test(strncmp, strncmp_equal_string_empty2)
{
    char s[] = "";
    char s2[] = "";

    cr_assert_eq(strncmp(s, s2, 0), 0);
}

Test(strncmp, strncmp_equal_string_empty3)
{
    char s[] = "fdsfdsfdsds";
    char s2[] = "";

    cr_assert_eq(strncmp(s, s2, 9), 102);
}

Test(strcasecmp, strcasecmp_not_equal)
{
    char s[] = "f";
    char s2[] = "d";

    cr_assert_eq(strcasecmp(s, s2), 2);
}

Test(strcasecmp, strcasecmp_not_equal2)
{
    char s[] = "f";
    char s2[] = "D";

    cr_assert_eq(strcasecmp(s, s2), 2);
}

Test(strcasecmp, strcasecmp_not_equal_string)
{
    char s[] = "ffdfdfd";
    char s2[] = "ffsqdsq";

    cr_assert_eq(strcasecmp(s, s2), -15);
}

Test(strcasecmp, strcasecmp_not_equal_string2)
{
    char s[] = "ffdfdfd";
    char s2[] = "ffsqdsq";

    cr_assert_eq(strcasecmp(s, s2), -15);
}

Test(strcasecmp, strcasecmp_equal_string_empty)
{
    char s[] = "";
    char s2[] = "";

    cr_assert_eq(strcasecmp(s, s2), 0);
}

Test(strcasecmp, strcasecmp_equal_string_empty2)
{
    char s[] = "doskds";
    char s2[] = "DoskDS";

    cr_assert_eq(strcasecmp(s, s2), 0);
}

Test(strcasecmp, strcasecmp_equal_string_empty3)
{
    char s[] = "fdsfdsfdsds";
    char s2[] = "";

    cr_assert_eq(strcasecmp(s, s2), 102);
}

Test(strcasecmp, strcasecmp_equal_string_uppecase_and_lower)
{
    char s[] = "fdsfdsfdsds";
    char s2[] = "FDsFDsFdSDs";

    cr_assert_eq(strcasecmp(s, s2), 0);
}

Test(strcasecmp, strcasecmp_equal_string_uppecase)
{
    char s[] = "fdsfdsfdsds";
    char s2[] = "FDSFDSFDSDS";

    cr_assert_eq(strcasecmp(s, s2), 0);
}

Test(strcasecmp, strcasecmp_equal_uppecase_lower)
{
    char s[] = "fdsfdsfdsds//";
    char s2[] = "FDSFDSFDSDSf";

    cr_assert_eq(strcasecmp(s, s2), -55);
}

Test(strcasecmp, strcasecmp_equal_uppecase_lower2)
{
    char s[] = "fdsfdsfdsds//";
    char s2[] = "FDSFDSFDSDSF";

    cr_assert_eq(strcasecmp(s2, s), 55);
}

Test(strcasecmp, strcasecmp_equal_uppecase_lower3)
{
    char s[] = "";
    char s2[] = "FDSFDSFDSDSF";

    cr_assert_eq(strcasecmp(s2, s), 102);
}

Test(strcasecmp, strcasecmp_empty)
{
    char s[] = "";
    char s2[] = "";

    cr_assert_eq(strcasecmp(s2, s), 0);
}

Test(strcasecmp, strcasecmp_not_equal3)
{
    char s[] = "dazdzadazdgfdg";
    char s2[] = "DLQPDKSQP";

    cr_assert_eq(strcasecmp(s2, s), 11);
}

Test(strcasecmp, strcasecmp_not_equal4)
{
    char s[] = "dazdzadazdgfdg";
    char s2[] = "DLQPDKSQP";

    cr_assert_eq(strcasecmp(s, s2), -11);
}

Test(strpbrk, strpbrk)
{
    char s[] = "AEIOAEOFAEIZAEIZA";
    char s2[] = "FDSFDSFDSDSF";

    cr_assert_str_eq(strpbrk(s, s2), "FAEIZAEIZA");
}

Test(strpbrk, strpbrk_empty)
{
    char s[] = "";
    char s2[] = "";

    cr_assert_eq(strpbrk(s2, s), 0);
}

Test(strcspn, strcspn)
{
    char s[] = "AEIOAEOFAEIZAEIZA";
    char s2[] = "FDSFDSFDSDSF";

    cr_assert_eq(strcspn(s, s2), 7);
}

Test(strcspn, strcspn2)
{
    char s[] = "A4EIOAEOFAEIZAEIZA";
    char s2[] = "FDSFDSFDS4DSF";

    cr_assert_eq(strcspn(s, s2), 1);
}

Test(strcspn, strcspn_empty)
{
    char s[] = "";
    char s2[] = "";

    cr_assert_eq(strcspn(s2, s), 0);
}

Test(strstr, strstr)
{
    char s[] = "Bonjour Worldu";
    char s2[] = "on";

    cr_assert_str_eq(strstr(s, s2), "onjour Worldu");
}

Test(strstr, strstr_not_found)
{
    char s[] = "";
    char s2[] = "fr";

    cr_assert_eq(strstr(s, s2), NULL);
}

Test(strstr, strstr_not_found2)
{
    char end = '\0';
    char s[] = "ahvbjhtestadrr";

    cr_assert_str_eq(strstr(s, &end), "ahvbjhtestadrr");
}

Test(strstr, strstr_not_found_uppercase)
{
    char s[] = "aaa";
    char s2[] = "AAA";

    cr_assert_eq(strstr(s, s2), NULL);
}

Test(strstr, strstr_empty_src)
{
    char s[] = "frrr";
    char s2[] = "";

    cr_assert_str_eq(strstr(s, s2), "frrr");
}

Test(strstr, strstr_src2)
{
    char s[] = "frrr";
    char s2[] = "g";

    cr_assert_eq(strstr(s, s2), NULL);
}

Test(strstr, strstr_empty_dest)
{
    char s[] = "";
    char s2[] = "fdsfds";

    cr_assert_eq(strstr(s, s2), NULL);
}

Test(strstr, strstr_empty_both)
{
    char s[] = "";
    char s2[] = "";

    cr_assert_str_eq(strstr(s, s2), "");
}

Test(strstr, strstr_not_equal2)
{
    char s[] = "dsqdqs";
    char s2[] = "gfessd";

    cr_assert_eq(strstr(s, s2), NULL);
}

Test(strstr, strstr_find_equal3)
{
    char s[] = "helloworld!";
    char s2[] = "or";

    cr_assert_str_eq(strstr(s, s2), "orld!");
}

Test(memmove, memmove)
{
    char memmove_string[] = "Faking.";
    memmove(memmove_string + 1, memmove_string, 6);

    cr_assert_str_eq(memmove_string, "FFaking");
}

Test(memmove, memmove2)
{
    char memmove_string2[] = "Faking.";
    memmove(memmove_string2, memmove_string2 + 1, 6);
    cr_assert_str_eq(memmove_string2, "aking..");
}

Test(memmove, memmove3)
{
    char memmove_string2[] = ".";
    memmove(memmove_string2, memmove_string2 + 1, 6);
    cr_assert_str_eq(memmove_string2, "");
}

Test(memmove, memmove4)
{
    char s[] = "Bonjourno Paris";
    char s2[] = "Sheeesh";

    memmove(s, s2, 7);
    cr_assert_str_eq(s, "Sheeeshno Paris");
}

Test(memmove, memmove5)
{
    char memmove_string2[] = ".dksoqdksoq";
    memmove(memmove_string2, memmove_string2 + 5, 6);
    cr_assert_str_eq(memmove_string2, "qdksoqdksoq");
}

Test(memmove, memmove6)
{
    char memmove_string2[] = ".dksoqdksoq";
    memmove(memmove_string2, memmove_string2 + 5, 6);
    cr_assert_str_eq(memmove_string2, "qdksoqdksoq");
}

Test(memmove, memmove7)
{
    char memmove_string2[] = "Alcohol";
    memmove(memmove_string2, memmove_string2 + 2, 4);
    cr_assert_str_eq(memmove_string2, "cohohol");
}

Test(memmove, memmove8)
{
    char memmove_string2[] = "Alcohol";
    memmove(memmove_string2, memmove_string2, 4);
    cr_assert_str_eq(memmove_string2, "Alcohol");
}