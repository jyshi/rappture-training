      program letters

      implicit none
      integer nletters
      parameter ( nletters = 26 )

c     wordb search state: -1 = starting
c                          0 = found space
c                          1 = found word
c
c     nwords counts number of words
c     count(x) counts number of letters for each letter x
      integer wordb / 0 /
      integer nwords / 0 /
      integer count(nletters), i, c
      character*100 line

c     zero out all counts
      do 10 i=1,nletters
        count(i) = 0
 10   continue

      write(6,*) 'Type in a sentence:'
      read(5,'(a100)') line

      do 20 i=1,len(line)
        if ((line(i:i).eq.' ').or.(line(i:i).eq.'\t').or.
     +      (line(i:i).eq.'\n')) then
          wordb = 0
        else if ((line(i:i).ge.'a').and.(line(i:i).le.'z')
     +      .or. (line(i:i).ge.'A').and.(line(i:i).le.'Z')) then
            if (wordb.eq.0) then
                nwords = nwords + 1
                wordb = 1
            endif
        endif

        if (line(i:i).ge.'A'.and.line(i:i).le.'Z') then
            c = ichar(line(i:i)) - ichar('A') + 1
        else
            c = ichar(line(i:i)) - ichar('a') + 1
        endif
        if (c.ge.1 .and. c.le.nletters) then
            count(c) = count(c) + 1
        endif
 20   continue

c     print out results
      write(6,*) 'Statistics:'
      write(6,99) nwords
 99   format(i5, ' words'/)

      do 30 i=1,nletters
        if (count(i).gt.0) then
          write(6,199) char(i+ichar('a')+1), count(i)
 199      format('Letter ',a1,': ',i4)
        endif
 30   continue

      end
